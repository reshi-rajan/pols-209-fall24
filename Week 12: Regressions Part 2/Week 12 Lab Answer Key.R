####### Regressions Part 2 #######

### What is the first thing we have to do when we open R-Studio?

### Disable Scientific Notation ###
options(scipen = 999)

#### Load the Data ####
doctor_who <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/refs/heads/Lab-Report-4/afghanschools.csv")


#### Review: Multivariate Regression ####
### Questions: 
## 1. What is a regression? 

# Regression is an estimation procedure to find the relationship between a value
# of interest, aka our independent variable, and our outcome of interest, aka 
# our dependent variable. Regression models do this by estimating a line of best fit
# that captures any conditional average relationship between our IV and DV.

## 2. Why do we do multivariate regression as opposed to bivariate regression?

# We do multivariate regression because often times we have confounding variables,
# where a variable causes our DV and is correlated to our IV. By including it in
# our regression model we close off these confounding paths so we can figure out
# what the relationship between our IV and DV really is.

## 3. What does the regression formula look like in R? 

# regression <- lm(y ~ x, data = dataframe)

## 4. What and How do we look for the results of the regression?

# We use the summary function, summary(regression)

#### Interaction Terms ####
### What is an interaction term and why do we use it? 

### To interpret an interaction term requires a bit more work that a standard
### covariate. Interpretation should look something like the following: 
### For a one-unit increase in X, there is a xxx-unit increase in Y, 
### when condition Z is present (or equals 1 or occurs, etc.), all else equal.

#### Try It ####
### Produce Model3 where you include an interaction term for treatment and girl
## as well as the previous covariates from Model2.

Model3 <- lm(testscores ~ treatment + girl + treatment*girl + age + sheep 
             + duration_village + education_head + number_ppl_hh + 
               distance_nearest_school, data = doctor_who)

### Load the summary of Model3 using the code below:
summary(Model3)

### How do we interpret the interaction term results? 

## For this model, we should say: for a one-unit increase in X,
## there is a (0.065 + 0.12 = 0.185) unit increase in test scores, when the students
## are girls, all else equal. 

## Likewise, we could say that for a one-unit increase in X, there is a 0.12-unit
## increase in test scores when the students are boys, all else equal.

#### Predictions ####
### Before we do predictions, the most important thing to note is what 
### descriptive statistic we use to calculate predicted values. 

### For a continuous variable ONLY, we use the mean. For ALL ELSE, we use the median.

### The first step in generating predicted values is determining whether your variable
### is continuous or not. 

#### Try It ####
### For a boy who did NOT attend school, 
### how should we calculate our predicted value?

### Using the code below, do we need to alter anything? 

predict(Model3, newdata = 
          data.frame(treatment = 0, girl = 0,
                     age = median(doctor_who$age, na.rm = T),
                     sheep = median(doctor_who$sheep, na.rm = T),
                     duration_village = median(doctor_who$duration_village, na.rm = T),
                     education_head = median(doctor_who$education_head, na.rm = T),
                     number_ppl_hh = median(doctor_who$number_ppl_hh, na.rm = T),
                     distance_nearest_school = median(doctor_who$distance_nearest_school, na.rm = T)))

### What about for a girl who went to school?
predict(Model3, newdata = 
          data.frame(treatment = 1, girl = 1,
                     age = median(doctor_who$age, na.rm = T),
                     sheep = median(doctor_who$sheep, na.rm = T),
                     duration_village = median(doctor_who$duration_village, na.rm = T),
                     education_head = median(doctor_who$education_head, na.rm = T),
                     number_ppl_hh = median(doctor_who$number_ppl_hh, na.rm = T),
                     distance_nearest_school = median(doctor_who$distance_nearest_school, na.rm = T)))

#### Stargazer ####
### Stargazer is a package in R that generates really nice, professional, publishable
### tables that you can use. 

### Installing Stargazer
## To install stargazer, use the following code: 
install.packages('stargazer')

## Then run the following line:
library(stargazer)

### To make a nice publishable-ready table that includes all 3 models, we can
### use the following command: 

stargazer(Model1, Model2, Model3, type = "text", 
          title = "Schooling in Afghanistan", 
          covariate.labels = c("School attendance",
                               "Girl",
                               "Age",
                               "# of sheep",
                               "Duration in village",
                               "Education level of parent",
                               "# of people in household",
                               "Distance to school",
                               "School attendance * Girl"), 
          dep.var.labels = "Test Scores")
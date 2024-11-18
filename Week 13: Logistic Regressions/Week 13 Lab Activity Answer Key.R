####### Week 13: Logistic Regression #######

### What is the first thing we have to do when we open R-Studio?

### Disable Scientific Notation ###
options(scipen = 999)

#### Load the Data ####

brooklyn_99 <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-5/nov18survey.csv")

#### Logit Models ####
### 1.When should we use a logit model over a "regular" regression?

## We should use a logit model over the classical linear model when our dependent
## variable is binary. This only applies to the DV, the IVs can be of any type. 

### 2.What is the key difference between a regular regression and a logit model? 

## The key difference between the classical linear model and logit models is the
## use of conditional probabilities. Rather than assuming our line of best fit that
## the regression model figures out is for the average value of y when x equals 
## some value. The logit model finds the average probability y equals 1, when
## x is some value, all else equal.

#### Estimating a Logit Model ####
### To estimate the relationship between the variable hardtorelate and age,
### we can use the logit model below: 
Model1 <- glm(hardtorelate ~ age, 
              data = brooklyn_99, family = 'binomial')

###### Try It ######
### Estimate Model2 where you add the following controls: 
### democrat, republican, gender, ideo5, educ
Model2 <- glm(hardtorelate ~ age + democrat + gender +
                          ideo5 + educ + republican, 
                        data = brooklyn_99, family = 'binomial')

### Looking at the regression table: 
summary(Model2)

### How do we know what variables are statistically significant in this model? 

## As always, we use the stars and p-values. The more stars we have, the more 
## significant our results are.

#### Interpreting Logit Models ####
### From class, how are we able to interpret logit model coefficients? 

## To interpret our logit models we use the log-odds ratio. To do this it depends
## on whether the sign of our estimate is positive or negative.

## If negative: (1-exp(estimate))*100 
## If positive: (exp(estimate)-1)*100

##### Try It #####
### NOTE: To exponentiate in R, we have to use the exp() function

(exp(0.016001)-1)

### If the odds ratio < 1, the probability Y=1 decreases (with a 1 unit increase in X), 
### if the odds ratio > 1, the probability Y=1 increases (with a 1 unit increase in X).

### To interpret this odds ration on line 59, we say something similar to: 
### for a one unit increase in X, there is a xxx-percent increase in the odds Y = 1.

### In this case, we would say something like, for a one unit increase in age, 
### there is a 1.6% increase in the odds you responded it is hard to relate, all else equal.

#### Predicted Probabilities ####
### To calculated the predicted probability Y=1, we use the following code:

### Before we use the predict function, we need to gather the information
### of interest from the variables.

### Specifically, we need: 
### Age to be 35
### Education to be High School
### Ideology to be Moderate
### Gender to be Male
### Democrat to be True


### How do we do this with the following: 
predict(Model2,
        data.frame(age = 35,
                   educ = 2,
                   ideo5 = 3,
                   gender = 0,
                   democrat = 1,
                   republican = 0),
        type = "response" )

#### Not Included ####
### Sometimes we like to convey our predicted probabilities 
### using predicted probability plots: 
# install.packages('marginaleffects')

library(tidyverse)
library(marginaleffects)

pred_probs <- avg_predictions(Model2, variables = 'age', type = 'response')

pred_probs |>
  ggplot(mapping = aes(x=estimate, y=age)) +
  geom_point() + 
  geom_pointrange(mapping = aes(xmin = conf.low, xmax = conf.high)) + 
  theme_bw() + 
  xlab('Predicted Probability') + 
  ylab('Age')

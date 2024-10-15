############## Lab Report 2 - T-Tests & Chi-Squared Tests ##############
                            ### ANSWER KEY ###

#### Getting Started #####
### What is the first thing we do when we open RStudio?
# We have to set our working directory to POLS 209! 

## Once we are ready to go, let's load in the data we are going to use into
## the environment pane. 
data <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-2/oilwomen.csv")

## To make it easier to read, let's disable scientific notation 
## to see the p-values properly.

options(scipen = 999)

#### Regional Differences in Representation ####
### Before we can address the question asked, what are our comparison variables? 
### If multiple, let's pick one for class. 

# Our variables are: 
# 1. Average Women's Representation Globally
# 2. Average Women's Representation Regionally (let's pick Asia)

### Are these variables continuous or categorical? What do our values mean?

# The first variable (Average Women's Representation Globally) is continuous.
# The second variable (Average Women's Representation Regionally) is categorical.

### Now that we know what they are, what type of test should we use? 
### Should we use a t-test or a chi-square test or a regression? 

# If we have one variable that is continuous and one that is categorical, we 
# need to use a difference of means or t-test. 

## To actually estimate the results let's run some code and understand our results!
t.test(data$female_seats ~ data$asia)  

# We can see from this the difference in means is 0.177 and this result is NOT 
# statistically significant as our p-value is greater than the 0.05 threshold. 
# The mean for those not in Asia is 14.99320 and the mean for countries in Asia
# is 14.614.

#### Comparing Across Regions ####
## To compare across regions, we need to run a t-test or difference in means test.

### Before we can do that, we need to first subset the data, how do we do that? 
# If we want to first look at the Middle East and North Africa (MENA) and Africa
# lets subset these first. 

MENA <- subset(data, me_nafr == 1)
africa <- subset(data, ssafrica == 1)

## Now that we have subsetted our data, let's see if there is a statistically 
## significant difference in women's representation across regions.

t.test(MENA$female_seats, africa$female_seats)

### How do I do this for MENA vs Asia?
# Subset
asia <- subset(data, asia == 1)
# Difference in Means
t.test(MENA$female_seats, asia$female_seats)

#### PR & Women's Representation ####
## To do a tabular analysis, we use the following code: 
table(data$PR, data$female_seats_15)

### If we want to see if we can reject the null, we first have to define it. 
### What is the null hypothesis? 

# Our null hypothesis is "there is no significant difference between PR and
# non-PR systems in having above average women's representation." 

### What type(s) of variable are our independent and dependent variables? 
### What kind of test does this suggest? 

# Our independent variable is whether a country has a PR system. 
# Our dependent variable is whether the country's female representation is above
# average. 

# This means our IV is categorical and our DV is also categorical, thus we need
# to use a chi-square test.

## Now that we figured out the null and the type of variables we have we can
## run some code. 

# cross-tabulation table
table(data$PR, data$female_seats_15) 

# Chi-Square Test
chisq.test(data$PR, data$female_seats_15, correct = FALSE)

### Can we reject the null? What does it mean if we do? 

# This chi-square result is 16.466, this does not inherently mean anything, but 
# the p-value is well below the 0.05 threshold and thus statistically significant.
# This indicates that we can reject the null in favor of our alternative 
# that there is a relationship and thus conclude that countries with PR systems
# have greater proportions of female legislators.

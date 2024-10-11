############## Lab Report 2 - T-Tests & Chi-Squared Tests ##############

#### Getting Started #####
### What is the first thing we do when we open RStudio?

## Once we are ready to go, let's load in the data we are going to use into
## the environment pane. 
data <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-2/oilwomen.csv")

## To make it easier to read, let's disable scientific notation 
## to see the p-values properly.

options(scipen = 999)

#### Regional Differences in Representation ####
### Before we can address the question asked, what are our independent and
### dependent variables? If multiple, let's pick one for class. 

### Are these variables continuous or categorical? What do our values mean?

### Now that we know what they are, what type of test should we use? 
### Should we use a t-test or a chi-square test or a regression? 

## To actually estimate the results let's run some code and understand our results!
## code goes here! 

#### Comparing Across Regions ####
## To compare across regions, we need to run a t-test or difference in means test.

### Before we can do that, we need to first subset the data, how do we do that? 


## Now that we have subsetted our data, let's see if there is a statistically 
## significant difference in women's representation across regions.

t.test(MENA$female_seats, africa$female_seats)

### How do I do this for MENA vs Asia?

#### PR & Women's Representation ####
## To do a tabular analysis, we use the following code: 
table(data$PR, data$female_seats_15)

### If we want to see if we can reject the null, we first have to define it. 
### What is the null hypothesis? 

### What type(s) of variable are our independent and dependent variables? 
### What kind of test does this suggest? 

## Now that we figured out the null and the type of variables we have we can
## run some code. 

# cross-tabulation table
table(data$PR, data$female_seats_15) 
## Test goes here!

### Can we reject the null? What does it mean if we do? 
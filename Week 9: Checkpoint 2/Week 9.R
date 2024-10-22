#### Summarizing Data for your Codebooks #####
data <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-2/oilwomen.csv")


#### Continuous Variables ####
## For continuous variables, the quickest way to find the range of values the variable
# takes on, use the summary function.

# Ex. summary(dataframe$variable)

summary(data$female_seats)

# We should get back the following: 
#  Min.     1st Qu.  Median   Mean  3rd Qu.    Max.     NA 
#  0.00      8.30    12.20   14.96   20.10   48.80       9 

# From this we can see the percentage of female seats 
# take on a range of values from 0 to 48.80

#### Categorical Variables ####
## For categorical variables, we can use the summary function: 

summary(data$female_seats_15)

# This can also tells us that the values range from 0 to 1, but we may 
# still think this is continuous/interval data.

# If we use the unique function, we can see all
# the possible values this variable takes on. 

unique(data$female_seats_15)

# From this we can see that female seats 15 has 2 potential values: 0 and 1,
# excluding NA values.

#### Renaming Varibles #### 
# If our variables are too long we an rename them using the rename function in 
# TidyVerse. 

data <- rename(data, above_averege_female = female_seats_15)

# This renames the female_seats_15 variable to be above_average_female

## Quick note, sometimes variable names are numbers like 1996, to call this variable
## we need to use ``. 

# summary(dataframe$`1996`) 

## other times, we may need to use '' instead

# summary(dataframe$'1996')
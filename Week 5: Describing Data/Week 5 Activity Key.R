######## Week 5: Describing Data ##########
## Answer Key ##

#### Step 1: Import the Data #####
# From the github download sample_data.RData

# Remember move it into your POLS 209 folder

## This is where you need to remember to set your working directory
## This is what mine looks like: 
setwd("~/rrajan/Dropbox/TAMU/TA/POLS 209/")

# Then load the dataframe into the environment. 
# HINT: you should see data pop up with '100 obs. of 4 variables'

## The console should say:
load("~/sample_data.RData")

#### Step 2: Calculate Some Summary Statistics ####
# Calculate the mean for variable data$x

## Mean is calculated using the mean() function: 
mean(data$x)

#> mean(data$x)
#> [1] 3.693915

# Calculate the standard deviation (sd) for w

## Standard deviation is calculated using the sd() function:

sd(data$w)

#> sd(data$w)
#> [1] 4.194754

# BONUS: Calculate the median for y

## Median is calculated in R using the median() function:

median(data$y)

#> median(data$y)
#> [1] 9.54532

#### Step 3: Check ####
# With the person next to you see if you got the same answers (you should!)

#### Step 4: Describing Distributions ####
# This one is a little harder so I want us to do it together. 

# To describe the distribution of our data we should use the ggplot() function
# which is stored in the tidyverse library, so let's open the package.

# NOTE: if you do not have tidyverse installed, then you'll need to do the following
# install.packages('tidyverse')

# Open the tidyverse
library(tidyverse)

# Now let's make a histogram to see what each of our variables looks like.
# To make a histogram with ggplot use the following code: 
ggplot(data = data) +
  geom_histogram(mapping=aes(x=x))

# if you are like me, this doesn't look that nice, so let's change it up so it
# looks a little pretty:

ggplot(data=data) +
  geom_histogram(mapping = aes(x), bins = 50, 
                 fill = 'maroon', color = 'black') + 
  theme_bw()

# We have to write a little something about what this distribution looks like:
# The distribution is skewed to the right (i.e. the bulk of our data is on the left).

## What about the w variable? 

ggplot(data=data) +
  geom_histogram(mapping = aes(w), bins = 50, 
                 fill = 'maroon', color = 'black') + 
  theme_bw()

# In this variable the data is not necessairly skewed in any way, the bulk of our
# distribution is the center.
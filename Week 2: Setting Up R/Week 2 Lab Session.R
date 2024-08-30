#### Creating Our POLS-209 Folder ####
# Wherever you store your documents, go ahead and create a folder and label it 
# POLS 209. 

# This will be where you store all your R-work for our class as well as the lab 
# reports. Please make sure you do not delete this folder or anything inside it

#### Setting Up a Working Directory #### 
# To set up a working directory, go to session at the top of your screen, 
# click Set Working Directory
# Then click choose directory and select the `POLS 209` folder where your work
# for this class will live. 

# When you do successfully, your console should say something like this: 

#> setwd("~/rrajan/Documents/POLS 209")

#### Importing a Dataset ####
# To open data, you can import it through the environment.
# Now that we have set up our working directory, we can do this using the load() 
# function. 
# Before we do, we have to make sure that the data we want to 
# use lives in the POLS 209 Folder.

# Once you have downloaded the polity data, move it into your POLS 209 folder, 
## Always make sure the data you want to use lives in the POLS 209 folder.
# Once you have checked that the data is in the POLS 209 folder, 
# we can load in our data as below: 

# The simplest way to do this is by clicking 'Import Dataset' at the top of the 
# environment pane. Once you have done that click 'From Excel'. 

# It is important to note that you have to check what they file type is before 
# you choose where from you import the data. For example, polity_data.xls is 
# an excel file because the name ends in .xls. Different file types have different
# import options, .csv requires 'From Text (readr)' and .dta requires 'From Stata'

# Once you click 'From Excel' a new window opens, find the 'Browse' button on the 
# top right. Since we have set up our working directory as the POLS 209 folder
# AND we have ensured that our data is in this folder, it should pop up in the folder
# click the dataset and click the 'Import' button. 

# In your console, the following code R will run:
library(readxl)
polity_data <- read_excel("polity_data.xls")

# If your data is a R file, you do not have to import it
# you can click the folder button at the top left and have it directly enter the environment.

# Now that our dataset is in R, we can view it using the View() function. 

# To view our dataset, we can run this line of code: 
View(polity_data)

## It is important to note that this dataset has a particular name in R. These 
# datasets are specifically called dataframes in R and they are the largest type of 
# file that R can play with.

#### Other Types of Data ####
# There are other types of data R can play with that are smaller: 

#1.  An element is the smallest type of data R can play with, they are 1 single value in R.
# E.g. 
x <- 2

#2. A vector is a long list either vertically (column) or horizontally (row) of elements
# E.g. 
y <- (1:10)

#3. A matrix is a combination of multiple vectors together
# E.g. 
z <- matrix(c(1:50), nrow = 5, ncol = 10)
# In this line of code I told R I want a matrix spanning the numbers from 1 to 50
# I told it that I wanted this matrix to specifically have the dimensions of 5 rows 
# and 10 columns and lastly to label this matrix z.

#### Creating a New Variable ####
# Going back to our polity data, we can create 
# new columns (variables) in our polity dataset. 

# Say we wanted to create a variable that is the difference in the 
# democracy score and the autocracy score. We can do that as: 
polity_data$dem_diff <- polity_data$democ - polity_data$autoc

# This is the simplest way of generating a new variable from existing variables.

# We can also create a new variable using conditional statements with ifelse command.
# Say we wanted to a simple 0 or 1 value for if we consider a country-year to be 
# a democracy or not. We can do this by saying that if a country's polity2 score
# is greater than 5 (on a 10 point scale), then the country is a democracy. 
# This is a conditional statement in R, we are telling R to generate a new variable
# based on the value of an existing variable. We can do this using the ifelse statement below: 
polity_data$democracy <- ifelse(polity_data$polity2 > 5, 1, 0)

# What this line of code is doing is telling R to find the polity_data dataframe
# specifically find the polity2 values in this dataframe and for every observation 
# (country-year) see if the value is greater than 5. If it is, for the new variable
# we are creating, give this country-year a value of 1, if the polity2 value is less than 
# 5, give this country-year a value of 0. 

# NOTE: an ifelse statement works like this: the first argument before the comma
# is the test we want R to run on the variable, the second argument, the middle one,
# is the value the new variable will have if the test was passed, the third argument
# is the value the new variable will have if the test failed.
########## Describing Data ##########
## Today we will be describing data through various visualizations including:
## histograms, scatterplots, and box-and-whisker plots.

## NOTE: I will be teaching these using ggplot and the tidyverse, if you wish
## to use the standard R functions for these, that is fine. I myself do not know
## how to use them, I was trained with tidyverse, but either version in ok. A 
## separate file for the vanilla R plots will be provided. 

## The first thing we need to do is load in the tidyverse. If you did not install
## it previously, run the code below without the pound symbol.
# install.packages('tidyverse)

library(tidyverse)

## Now remember to load in the data: 
## NOTE: Remember to set you working directory to your POLS 209 Folder
library(readr)
data <- read_csv("~/POLS 209/Fariss2010.csv")

#### Making Histograms #####
## This code is an adaptation from last week's code to make a histogram.

ggplot(data=data) +
  geom_histogram(mapping = aes(polity2), bins = 50, 
                 fill = 'maroon', color = 'black', na.rm = T) + 
  xlab('Polity2 Score') + 
  ylab('Frequency') + 
  ggtitle('Figure 1: Distribution of Polity Scores') +
  theme_bw()

#### Making Barplots ####
## There are two different ways of making our barplots, either having each 
## category side by side or stacked one on top of the other.

# The first way to do is is have each bar side by side
ggplot(data=data) +
  geom_bar(mapping = aes(x=TreatyCount),
                 fill = 'darkgoldenrod', color = 'black', na.rm = T) + 
  xlab('Polity2 Score') + 
  ylab('Frequency') + 
  ggtitle('Figure 2: Total Number of Human Rights Treaties Signed') +
  theme_bw()

# The second way is having each bar stacked on top of each other
ggplot(data=data) +
  geom_bar(mapping = aes(y=TreatyCount),
           fill = 'royalblue', color = 'black', na.rm = T) + 
  xlab('Polity2 Score') + 
  ylab('Frequency') + 
  ggtitle('Figure 3: Total Number of Human Rights Treaties Signed') +
  theme_bw()

#### Making Scatterplots ####
## Perhaps the most important type of plot in political science is a scatter plot.
## Scatter plots are useful because they allow us to show 2 (maybe even more) variables
# on the same graph. 

## This first graph is a standard x-y graph, it conveys the polity scores of 
# countries with respect to their level of respect for human rights
ggplot(data = data) +
  geom_point(mapping= aes(x=polity2, y=respectHR), na.rm = T) + 
  xlab("Polity Scores") +
  ylab("Respect for Human Rights") +
  ggtitle('Figure 4: Relationship between the polity score 
          and respect for human rights') +
  theme_bw()

## We can also add some more detail by showing if a country 
## is a democracy or non-democracy.

## We do this by using the group aesthetic. 

ggplot(data = data) +
  geom_point(mapping = aes(x=polity2, y=respectHR, 
             color = as.factor(democracy)), na.rm = T) + 
  xlab("Polity Scores") +
  ylab("Respect for Human Rights") +
  ggtitle('Figure 5: Relationship between the polity score 
          and respect for human rights') +
  scale_color_manual(name = 'Democracy vs Autocracy', 
                     values = c("0" = "red", "1" = "blue"), 
                     labels = c('Non-Democracy', 'Democracy')) +
  theme_bw()

#### Additional Notes ####
### Missing Values ###
## If you have missing values in your variable, you need to use na.rm to calculate
## your summary statistics. For example, to calculate the variance of polity 
## score we would do the following: 

var(data$polity2, na.rm = TRUE)

## This ensures that the variance function can run. If you leave missing values,
## R does not know to get rid of them on its own. 

### Subsetting your data ### 
## There are 2 main ways to do this, for this project, the best way is to use 
## the standard R method.

## If I want to calculate the average number of human rights treaties a 
## democracy has signed, I can do the following: 
mean(data$TreatyCount[data$democracy == 1], na.rm = TRUE)

## it is important to note that what is going on under the hood is that 
## we are telling R to calculate the mean of TreatyCount, but what the brackets 
## [] are doing is telling R to make sure it calculates the mean but only for 
## when the democracy variable (in dataframe data) is equal to 1. It is important
## to use the 2-equal signs (==), this means a logical statement in R and so
## R is not expecting math but some sort of statement you want it to evaluate.
## In this instance it is being asked to evaluate if democracy == 1.
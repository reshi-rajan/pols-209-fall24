#### Making Boxplots ####
## Boxplots are a really useful visualization of summary statistics.
## In a boxplot, we are able to visualize the median, interquartile ranges,
## the maximum and minimum values and any potential outliers.

#### Example Boxplot #####
#### Load in Data ####
data <- read.csv("https://raw.githubusercontent.com/ilaydaonder/POLS209/Lab-Report-1/Fariss2010.csv")

#### Load in TidyVerse ####
library(tidyverse)

ggplot(data=data) +
  geom_boxplot(mapping=aes(y=respectHR)) + 
  ylab('Respect for HR')+
  theme_bw()

## In this boxplot, we can see that the thick, solid line in the middle of the box
## is the median value. The two thinner horizontal lines that create the rest of
## of the box are the 25th percentile and 75th percentile (the interquartile ranges)
## The top and bottom points where the vertical line goes through the box 
## are the minimum and maximum. The top point represents the maximum. The bottom
## point represents the minimum. 
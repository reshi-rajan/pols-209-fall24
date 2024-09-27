#### Load the Data ####
library(readr)
Fariss2010 <- read_csv("~/POLS 209/Fariss2010.csv")

## If you have not already done this, download the tidyverse:
install.packages('tidyverse')

## Open Tidyverse
library(tidyverse)

#### Histogram ####
ggplot(data=data) +
  geom_histogram(mapping = aes(x=polity2), bins = 50, 
                 fill = 'maroon', color = 'black') + 
  xlab('Polity2 Score') + 
  ylab('Frequency') + 
  ggtitle('Figure 1: Frequency Distribution of Polity2 Scores') + 
  theme_bw()

mean(data$polity2, na.rm=TRUE)

#### Bar Graphs ####
ggplot(data=data) +
  geom_bar(mapping = aes(y=TreatyCount), 
                 fill = 'maroon', color = 'black') + 
  xlab('Treaty Count') + 
  ylab('Distribution') + 
  ggtitle('Figure 2: Distribution of Ratified Treaties') + 
  theme_bw()

#### Scatterplots ####
ggplot(data=data) +
  geom_point(mapping = aes(x=polity2, y=respectHR), 
                 fill = 'maroon', color = 'black') + 
  xlab('Polity2 Score') + 
  ylab('Respect for HR') + 
  ggtitle('Figure 3: Relationship between Polity Score and HR Treaties Ratified') + 
  theme_bw()

#### Additional Notes 
## Subsetting Data
# For when a country is a democracy
data1 <- subset(data, data$democracy == 1)
mean(data1$respectHR, na.rm = TRUE)

# For when a country is NOT a democracy
data1 <- subset(data, data$democracy == 0)
mean(data1$respectHR, na.rm = TRUE)

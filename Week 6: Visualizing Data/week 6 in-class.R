install.packages('tidyverse')

library(tidyverse)
#### Histogram ####
ggplot(data=data) +
  geom_histogram(mapping = aes(x=polity2), bins = 50, 
                 fill = 'maroon', color = 'black') + 
  xlab('Polity2 Score') + 
  ylab('Frequency') + 
  ggtitle('Figure 1: Frequency Distribution of Polity2 Scores') + 
  theme_bw()

#### Bar Graphs ####
ggplot(data=data) +
  geom_bar(mapping = aes(x=TreatyCount), 
                 fill = 'maroon', color = 'black') + 
  xlab('Treaty Count') + 
  ylab('Distribution') + 
  ggtitle('Figure 2: Distribution of Ratified Treaties') + 
  theme_bw()
#### Scatterplots ####
ggplot(data=data) +
  geom_point(mapping = aes(x=polity2, y=TreatyCount), 
                 fill = 'maroon', color = 'black') + 
  xlab('Polity2 Score') + 
  ylab('Number of Ratified Treaties') + 
  ggtitle('Figure 3: Relationship between Polity Score and HR Treaties Ratified') + 
  theme_bw()

#### Additional Notes 
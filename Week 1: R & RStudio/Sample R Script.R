# This an R Script. R scripts allow you to save your work in a file to access
# in the future.

# To save something as a note, you need to the use the pound/hashtag symbol. 
# If you don't use a note, R will think you are asking it do something.

### Opening Data

# The first thing you will want to do is set a working directory. 
# To do this, go to session at the top of your screen, click Set Working Directory
# Then click choose directory and select the folder where your data lives. 

### Sample Data

# To open data, you can import it from the files pane or through the environment.
# If you open it thru the environment, you need to click import dataset if the 
# file is .dta or .csv 

# If your data is a R file, you can click the folder button at the top left.

# I have set my directory to downloads, so I can pull our sample data using the 
# following code (to run a line of code, highlight the entire code and click
# run on the right-hand side of the screen):

load("~/Downloads/sample_data")

# To see the data, click on the data once it is in the environment, this allows 
# us to the see the observations (the rows) and the variables (the columns).

# We can do basic functions in R, like addition, subtraction, etc.: 
2 + 2
6*3
8/4
2^3

# We can also do more computationally exhausting functions as well, like 
# finding the mean, median, or standard deviation: 
mean(data$x)
# in the mean code, we have to tell R which dataset we want it to use and then tell
# it which variable to use. To do this, we need to use the dollar sign $, this tells
# R "hey, use the data dataset I have in my environment and specifically find the mean
# of the column I labelled x." 

# we can also find the standard deviation: 
sd(data$y)

### Visualizing
# Obviously, we wouldn't have R if it only did the basic stuff we can do with a 
# regular calculator, the cool thing about R is we can find lines of best fit
# and even plot our data.

# We can visualize data using the tidyverse package's ggplot library

# A library is an extra vocabulary that R sometimes needs. Base R only has a few
# "words" it knows. For those extra commands, we need libraries. To install a library
# do the following commands.

# E.g. Installing the tidyverse library: 
install.packages('tidyverse')

# To open the tidyverse package, use the following command:
library(tidyverse)
#NOTE: once you have installed the tidyverse you won't need to install it again,
# but you will need to open it each time you open R, using the library() function.

# Once we've opened tidyverse, R has the vocab to build graphs: 

ggplot(data = data, mapping = aes(x=x, y=y)) + 
  geom_point()

Mode <- function(x) {
  uniques <- unique(x)
  ux[which.max(tabulate(match(x, uniques)))]
}


Mode(dataframe$variable)
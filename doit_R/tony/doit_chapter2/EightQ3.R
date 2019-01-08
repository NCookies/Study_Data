library(ggplot2)
library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)

ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()

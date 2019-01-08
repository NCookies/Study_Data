library(ggplot2)
library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)

#Q1
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

#Q2
options(scipen = 99)
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)

options(scipen = 0)
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)

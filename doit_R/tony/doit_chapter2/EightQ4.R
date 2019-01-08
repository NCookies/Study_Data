library(ggplot2)
library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)

class_mpg <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))

ggplot(data = class_mpg, aes(x = class, y = cty)) + geom_boxplot()


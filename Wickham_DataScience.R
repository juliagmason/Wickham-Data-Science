#### Hadley Wickham R for Data Science ####

library(tidyverse)

### CH 3 Data Vis ###

mpg

ggplot (data = mpg) + 
  geom_point (mapping = aes (x = displ, y = hwy))

# Exercises
nrow(mtcars) # 32
ncol(mtcars) # 11

ggplot (mpg) +
  geom_point (aes (x = hwy, y = cyl))

ggplot (mpg) +
  geom_point (aes (x = class, y = drv))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# facets
ggplot (data = mpg) + geom_point (aes (x = displ, y = hwy)) + facet_wrap (~ class, nrow = 2)

ggplot (data = mpg) + geom_point (aes (x = displ, y = hwy)) + facet_grid (drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot (data = mpg) + geom_point (aes (x = displ, y = hwy)) + facet_grid (. ~ cyl)

ggplot (data = mpg) + geom_point (aes (x = displ, y = hwy)) + facet_wrap (~ cty, nrow = 2)

ggplot (data = mpg) + geom_point (aes (x = displ, y = hwy)) + facet_grid (. ~ cyl)


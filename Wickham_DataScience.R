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
  geom_point (aes (x = hwy, y = cyl)) # put alpha or color that you want to apply to the whole plot, not dependent on variable OUTSIDE the aesthetic

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

# 3.6 Geometric objects

ggplot (data = mpg) + geom_point (mapping = aes (x = displ, y = hwy)) # creates scatterplot 

ggplot (data = mpg) + geom_smooth (mapping = aes (x = displ, y = hwy)) # same information, but with a smoother instead of the dots. Default line color appears to be blue. 

ggplot (data = mpg) + geom_smooth (mapping = aes (x = displ, y = hwy, linetype = drv)) # separates different smoothers for type of drive, with corresponding linetypes. 

ggplot (data = mpg) + geom_point (mapping = aes (x = displ, y = hwy, color = drv)) + geom_smooth (mapping = aes (x = displ, y = hwy, linetype = drv, color = drv)) # overlays points on lines

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) # basic smoother again

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv)) # separates by drv but has same colors and linetype

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, colour = drv),
    show.legend = FALSE
  ) # separates by color and removes the legend

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy)) # multiple geoms via layering. note the duplication in the plot

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth() # cleaner code if you want to have consistent mappings

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth() # specifying aes in one layer changes the aesthetics for that layer only

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE) # you can also specify different data for specific layers

# 3.6 exercises
# line chart: geom_line. boxplot: geom_boxplot. histogram: geom_histogram. area plot: geom_area
# 2 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE) # removes gray CIs

# code for graphs
ggplot (data = mpg, mapping = aes (x = displ, y = hwy)) +
  geom_point(size = 2) + geom_smooth(se = FALSE)

ggplot (data = mpg, mapping = aes (x = displ, y = hwy)) +
  geom_point(size = 2) + geom_smooth(aes(group = drv), se = FALSE)

ggplot (data = mpg, mapping = aes (x = displ, y = hwy, color = drv)) +
  geom_point(size = 2) + geom_smooth(se = FALSE)

ggplot (data = mpg, mapping = aes (x = displ, y = hwy)) +
  geom_point(size = 2, aes(color = drv)) + geom_smooth(aes(linetype = drv), se = FALSE)

ggplot (data = mpg, mapping = aes (x = displ, y = hwy)) +
  geom_point(size = 2, aes(color = drv)) + geom_smooth(se = FALSE)

ggplot (data = mpg, aes(x = displ, y = hwy)) + geom_point (size = 4, col = "white") + geom_point (aes(col = drv))

# 3.7 Statistical transformations

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut)) # basic bar chart. Note that y axis, "count" refers to number of points/rows --> frequency. Bar charts, histograms, frequency polygons use "stat," which is like group_by(count = n())

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut)) # this is interchangeable with geom_bar

demo <- tribble(
  ~a,      ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = a, y = b), stat = "identity") # stat = identity plots the actual values of the bars

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1)) # plots proportion rather than count. not sure why the periods. 

ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  ) # produces a point with CIs

# 3.7 exercises
# 1. default geom with stat_summary is "pointrange" but maybe it's geom_histogram/geom_freqpoly?
ggplot (data = diamonds) + geom_pointrange( aes (x = cut, y = depth, ymin = min, ymax = max), stat = "identity") # ???

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1)) # need to set group = 1 inside aes but not sure why
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

# 3.8 Position adjustments 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut)) # use fill with bar charts; colorr just does outline

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity)) # using fill with another variable gives you stacked bar charts. Position controls the stacking; can adjust with position = 

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity") # change alpha bc position = identity overlaps them
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
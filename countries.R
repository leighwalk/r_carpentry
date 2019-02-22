# practice ggplot2

# installed ggplot2 already

# Open ggplot2
library("ggplot2")

# Initiate new variable called gapminder, first have to read the file
# default is that header if FALSE, so you need to say its true
gapminder <- read.csv("data/gapminder_data.csv",header=TRUE)

# Data Subsetting: 
gapminder[1,1] # looks at row 1, column 1
gapminder[1, ] # look at row 1, all columns
head(gapminder) # shows just top few lines
tail(gapminder) # bottom few
gapminder[900:905, ]# middle

# TASK 1
# aes: aesthetic properties, x & y locations, looks for column headings
# geom: tells how to visually represent the data
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))+geom_point()

# TASK 2 
# plot by year
ggplot(data = gapminder, aes(x = year, y = lifeExp))+geom_point()

# TASK 3
# color based on continent
ggplot(data = gapminder, aes(x = year, y = lifeExp, col = continent))+geom_point()

# TASK 4
# add another layer using line plot by country
ggplot(data = gapminder, aes(x = year, y = lifeExp, col = continent, by=country))+geom_line()

# TASK 5
# view lines & point
ggplot(data = gapminder, aes(x = year, y = lifeExp, col = continent, by=country))+
  geom_line()+geom_point()+theme_light()

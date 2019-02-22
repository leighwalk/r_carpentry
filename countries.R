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

## PLOTTING ## ----------------------------------------
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

# TASK 6
ggplot(data = gapminder, aes(x = year, y = lifeExp, by=country))+
  geom_line(aes(color = continent))+geom_point()
#alternative
ggplot(data = gapminder, aes(x = year, y = lifeExp, by=country))+geom_line(color = "blue")+geom_point()

# switching order of point/line affects the order its layerd

## STATS ## --------------------------------------
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, col = continent))+geom_point()

# TASK: use scale function (change x axis) & alpha function (transparency of points)
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point(alpha = 0.5) + scale_x_log10()

# TASK: smooth layer ~ adds the data trend, "lm" least squares regression method for each continent
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point(alpha=0.5) + 
  scale_x_log10()+
  geom_smooth(method = "lm")

# TASK: make line thicker
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent))+ # plot
  geom_point(alpha=0.5) + # layer 1
  scale_x_log10()+ # layer 2
  geom_smooth(method = "lm", size=1.5) # layer 3

# CHALLENGE: modify color and size of points on the point layer 
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent))+ # plot
  geom_point (color = "pink", size = 2, shape = 8) + # layer 1
  scale_x_log10()+ # layer 2
  geom_smooth(method = "lm", size=1.5) # layer 3

## COUNTRY SPECIFIC ## ---------------------------------------
starts.with <- substr(gapminder$country, start = 1, stop = 1)
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
ggplot(data = az.countries, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country)

ggplot(data = az.countries, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())

lifeExp_plot <- ggplot(data = az.countries, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())

ggsave(filename = "data/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")


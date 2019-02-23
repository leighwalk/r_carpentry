# Learning about the dplyr package
# Open ggplot2
library("ggplot2")

# Initiate new variable called gapminder, first have to read the file
# default is that header if FALSE, so you need to say its true
gapminder <- read.csv("data/gapminder_data.csv",header=TRUE)

# the long way of getting this data
mean(gapminder[gapminder$continent=="Africa","gdpPercap"])

## TIDYVERSE ## 

# 1. Load the package (already installed)
library(dplyr)

# 2. Select Columns (%>% is pipe) (select doesnt need quotes)
year_country_GDP <- gapminder %>% select(year, country, gdpPercap)
head(year_country_GDP)

# 3. Filter, select specific rows
year_country_GDP_Africa <- gapminder %>% 
  filter(continent=="Africa") %>%
  select(year, country, gdpPercap)

head(year_country_GDP_Africa)

# 4. Summarize by groups
gdp_by_continents <- gapminder %>% 
  group_by(continent) %>%
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continents

# CHALLENGE: calculate average life expectancy per country, longest v shortest?
life_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_life = mean(lifeExp))

    # using max min
life_country %>% filter(mean_life == min(mean_life))
life_country %>% filter(mean_life == max(mean_life))

    # alternative method: arrange
life_country %>% arrange(mean_life)
life_country %>% arrange(desc(mean_life))

    # alternative method: head/tale
life_country %>% arrange(mean_life) %>% head()
life_country %>% arrange(mean_life) %>% tail()

# 5. standard deviateion --> Standard Error
gapminder %>%
  group_by(continent) %>% 
  summarize(
    mean_life = mean(lifeExp),
    se_life = sd(lifeExp)/sqrt(n())
  )

## USING MUTATE ## --------------------------
gdp_pop_summary <- gapminder %>% 
  mutate(gdp_billions=gdpPercap*pop/10^9) %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdp_bill = mean(gdp_billions))
head(gdp_pop_summary)

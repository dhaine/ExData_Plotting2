## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad,
## nonroad) variable, which of these four sources have seen decreases in emissions
## from 1999-2008 for Baltimore City? Which have seen increases in emissions from
## 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

source("data_load.R")

nei_baltimore <- NEI[fips == "24510", ]

library(ggplot2)
ggplot(nei_baltimore, aes(factor(year), Emissions, fill = type)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ type, scales = "free", space = "free") + 
    labs(x = "Year",
         y = expression("PM"[2.5]*" (tons)"),
         title = expression("PM"[2.5]*" Emissions from 1999 to 2008"),
         subtitle = "Baltimore City, Maryland - By source type") +
    guides(fill = FALSE)
ggsave("plot3.png", width = 6, height = 4)

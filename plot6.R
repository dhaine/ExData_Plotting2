## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips=="06037").
## Which city has seen greater changes over time in motor vehicle emissions?

source("data_load.R")

get_vehicle <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case = TRUE)
scc_vehicle <- SCC[get_vehicle, SCC]
nei_vehicle <- NEI[NEI[, SCC] %in% scc_vehicle, ]
nei_vehicle_mdca <- nei_vehicle[fips == "24510" | fips == "06037", ]
nei_vehicle_mdca <- nei_vehicle_mdca[, city := ifelse(fips == "24510",
                                                      "Baltimore, MD",
                                                      "Los Angeles, CA")]

library(ggplot2)
ggplot(nei_vehicle_mdca, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ city, scales = "free", space = "free") +
    labs(x = "Year",
         y = expression("PM"[2.5]*" (tons)"),
         title = expression("PM"[2.5]*" Emissions from 1999 to 2008"),
         subtitle = "From motor vehicle sources")
ggsave("plot6.png", width = 6, height = 4)

## 5. How have emissions from motor vehicle sources changed from 1999-2008 in
## Baltimore City?

source("data_load.R")

get_vehicle <- grepl("vehicle", SCC[, SCC.Level.Two], ignore.case = TRUE)
scc_vehicle <- SCC[get_vehicle, SCC]
nei_vehicle <- NEI[NEI[, SCC] %in% scc_vehicle, ]
nei_vehicle_balti <- nei_vehicle[fips == "24510",]

library(ggplot2)
ggplot(nei_vehicle_balti, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity") +
    labs(x = "Year",
         y = expression("PM"[2.5]*" (tons)"),
         title = expression("PM"[2.5]*" Emissions from 1999 to 2008"),
         subtitle = "From motor vehicle sources - Baltimore City, Maryland")
ggsave("plot5.png", width = 6, height = 4)

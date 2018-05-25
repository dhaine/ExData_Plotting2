## 4. Across the United States, how have emissions from coal combustion-related
## sources changed from 1999-2008?

source("data_load.R")

get_coal <- grepl("coal", SCC[, Short.Name], ignore.case = TRUE) 
scc_coal <- SCC[get_coal, SCC]
nei_comb <- NEI[NEI[, SCC] %in% scc_coal]

nei_coal <- nei_comb[,
                     lapply(.SD, sum, na.rm = TRUE),
                     .SDcols = c("Emissions"),
                     by = year]

library(ggplot2)
ggplot(nei_coal, aes(factor(year), Emissions / 1000)) +
    geom_bar(stat = "identity") +
    labs(x = "Year",
         y = expression("PM"[2.5]*" (kilotons)"),
         title = expression("PM"[2.5]*" Emissions from 1999 to 2008"),
         subtitle = "From coal combustion-related sources")
ggsave("plot4.png", width = 6, height = 4)

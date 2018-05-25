## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to
## 2008? Using the base plotting system, make a plot showing the total PM2.5 emission
## from all sources for each of the years 1999, 2002, 2005, and 2008.

source("data_load.R")

pm25_total <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

png("plot1.png")
barplot(pm25_total[, Emissions] / 1000,
        names = pm25_total[, year],
        xlab = "Years", ylab = expression('PM'[2.5]*' (kilotons)'),
        main = expression('Total PM'[2.5]*' Emissions from 1999 to 2008'),
        las = 1)
dev.off()

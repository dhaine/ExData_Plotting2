## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
## (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot
## answering this question.

source("data_load.R")

pm25_baltimore <- NEI[fips == "24510",
                      lapply(.SD, sum, na.rm = TRUE),
                      .SDcols = c("Emissions"),
                      by = year]

png("plot2.png")
barplot(pm25_baltimore[, Emissions],
        names = pm25_baltimore[, year],
        xlab = "Years", ylab = expression('PM'[2.5]*' (tons)'),
        main = expression(atop("Total PM"[2.5]*" Emissions from 1999 to 2008", "Baltimore City, Maryland")),
        las = 1)
dev.off()

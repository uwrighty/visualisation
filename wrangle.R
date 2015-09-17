flights2003 <- read.csv('../Downloads/2003.csv')
flights2004 <- read.csv('../Downloads/2004.csv')
flights2005 <- read.csv('../Downloads/2005.csv')
flights2006 <- read.csv('../Downloads/2006.csv')
flights2007 <- read.csv('../Downloads/2007.csv')
flights2008 <- read.csv('../Downloads/2008.csv')

flights <- rbind(flights2003, flights2004)
flights <- rbind(flights, flights2005)
flights <- rbind(flights, flights2006)
flights <- rbind(flights, flights2007)
flights <- rbind(flights, flights2008)

flights['monthofyear'] <- with(flights, ISOdate(Year, Month, 1))


library(ggplot2)
ggplot(aes(x=date, y=ArrDelay), data=flights) +
  geom_point() +
  scale_x_datetime()

library(dplyr)
flights_by_day_carrier <- flights %>%
  group_by(monthofyear, UniqueCarrier) %>%
  summarise(cancelled_count= sum(Cancelled),
            diverted_count = sum(Diverted),
            avg_total_delay = mean(ArrDelay, na.rm = TRUE),
            avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE),
            avg_weather_delay = mean(WeatherDelay, na.rm = TRUE),
            avg_nas_delay = mean(NASDelay, na.rm = TRUE),
            avg_security_delay = mean(SecurityDelay, na.rm = TRUE),
            avg_late_aircraft_delay = mean(LateAircraftDelay, na.rm = TRUE),
            flights = n()) %>%
  arrange(monthofyear)

ggplot(aes(x=monthofyear, y=avg_total_delay, color=UniqueCarrier), data=flights_by_day_carrier) +
  geom_line() +
  scale_x_datetime()

carriers <- read.csv('../Downloads/carriers.csv')
flights_by_day_carrier <- left_join(flights_by_day_carrier, carriers)
flights_by_day_carrier['cancellation_ratio'] <- flights_by_day_carrier['cancelled_count']/flights_by_day_carrier['flights']
flights_by_day_carrier['diverted_ratio'] <- flights_by_day_carrier['diverted_count']/flights_by_day_carrier['flights']

library(jsonlite)
flightjson <- toJSON(flights_by_day_carrier)
cat(flightjson)
write(flightjson, "../Downloads/flight_by_carrier_by_month.json")


#try also grouping by origin & dest, what does that do to our volumes?
flights_by_month_carrier_origin <- flights %>%
  group_by(monthofyear, UniqueCarrier, Origin, Dest) %>%
  summarise(cancelled_count= sum(Cancelled),
            diverted_count = sum(Diverted),
            avg_total_delay = mean(ArrDelay, na.rm = TRUE),
            avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE),
            avg_weather_delay = mean(WeatherDelay, na.rm = TRUE),
            avg_nas_delay = mean(NASDelay, na.rm = TRUE),
            avg_security_delay = mean(SecurityDelay, na.rm = TRUE),
            avg_late_aircraft_delay = mean(LateAircraftDelay, na.rm = TRUE),
            flights = n()) %>%
  arrange(monthofyear)

flights_by_month_carrier_origin <- left_join(flights_by_month_carrier_origin, carriers)
flights_by_month_carrier_origin['cancellation_ratio'] <- flights_by_month_carrier_origin['cancelled_count']/flights_by_month_carrier_origin['flights']
flights_by_month_carrier_origin['diverted_ratio'] <- flights_by_month_carrier_origin['diverted_count']/flights_by_month_carrier_origin['flights']

flightjson <- toJSON(flights_by_month_carrier_origin)
write(flightjson, "../Downloads/flight_by_carrier_by_origin_by_month.json")

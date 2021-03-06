require(ggmap)
require(foreign)

melb <- read.dta("/Users/brendanhoung/example/melb.dta")

melbourne <- qmap(location='melbourne, Australia', zoom = 10) + theme_set(theme_bw())
melbourne_stamen <- qmap(location='melbourne, Australia', zoom = 10, source="stamen", maptype="watercolor") 
melbourne_toner <- qmap(location='melbourne, Australia', zoom = 10, source="stamen", maptype="toner") 
melbourne_osm <- qmap(location='melbourne, Australia', zoom = 10, source="osm") 

lat_range <- range(melbourne$data[2])
lon_range <- range(melbourne$data[1])


melbourne_toner +
geom_point(aes(x = lng, y = lat), size = 3, data = subset(melb, lng != "NA" & lat != "NA" )) +
scale_y_continuous('Latitude', limits = lat_range) +
scale_x_continuous('Longitude', limits = lon_range) +
opts(title = '20 Primary Schools (Stamen Toner)')     

melbourne_osm +
geom_point(aes(x = lng, y = lat), size = 3, data = subset(melb, lng != "NA"  & lat != "NA" )) +
scale_y_continuous('Latitude', limits = lat_range) +
scale_x_continuous('Longitude', limits = lon_range) +
opts(title = '20 Primary Schools (OSM)')  

melbourne +
geom_point(aes(x = lng, y = lat), size = 3, data = subset(melb, lng != "NA"  & lat != "NA" )) +
scale_y_continuous('Latitude', limits = lat_range) +
scale_x_continuous('Longitude', limits = lon_range) +
opts(title = '20 Primary Schools (Google Maps)')     

melbourne_stamen +
geom_point(aes(x = lng, y = lat), size = 3, data = subset(melb, lng != "NA"  & lat != "NA" )) +
scale_y_continuous('Latitude', limits = lat_range) +
scale_x_continuous('Longitude', limits = lon_range) +
opts(title = '20 Primary Schools (Stamen Watercolour)')     



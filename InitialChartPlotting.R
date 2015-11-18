

# Steve Stewart
# University of Chicago
# Capstone Project


# Clear R-Studio MEmory
rm(list=ls())

# Load required packages
library(ggmap)

# set woeking directory
setwd("C:/Users/Trader/Desktop/school/capstone")

# set quadrant size in miles, latirurde and longitude
latmi<-1
lonmi<-1


# Read building violations data
data<-read.csv("Building_Violations.csv",header=TRUE,stringsAsFactors=FALSE)

head(data)
colnames(data)

# Read 311 service requests data
data311<-read.csv("311_Service_Requests_-_Vacant_and_Abandoned_Buildings_Reported.csv",header=TRUE,stringsAsFactors=FALSE)

head(data311)
colnames(data311)


# Find rows that have VACA in Violation Descriptio
vrow<-grep("*VACA*",data$VIOLATION.DESCRIPTION)

#Examine Vrow data
length(vrow)
head(data$VIOLATION.DESCRIPTION[vrow])
head(data[vrow,])
tail(data[vrow,])

#  create seperate row vector of vacancy violations by year
v2006<-grep("*2006",data$VIOLATION.DATE[vrow])
length(v2006)
v2007<-grep("*2007",data$VIOLATION.DATE[vrow])
length(v2007)
v2008<-grep("*2008",data$VIOLATION.DATE[vrow])
length(v2008)
v2009<-grep("*2009",data$VIOLATION.DATE[vrow])
length(v2009)
v2010<-grep("*2010",data$VIOLATION.DATE[vrow])
length(v2010)
v2011<-grep("*2011",data$VIOLATION.DATE[vrow])
length(v2011)
v2012<-grep("*2012",data$VIOLATION.DATE[vrow])
length(v2012)
v2013<-grep("*2013",data$VIOLATION.DATE[vrow])
length(v2013)
v2014<-grep("*2014",data$VIOLATION.DATE[vrow])
length(v2014)
v2015<-grep("*2015",data$VIOLATION.DATE[vrow])
length(v2015)




#  get max and min latitude and longitude of all violations to define limits of city
maxlon<-max(na.omit(data[,21]))
minlon<-min(na.omit(data[,21]))
maxlat<-max(na.omit(data[,20]))
minlat<-min(na.omit(data[,20]))
maxlon
minlon
maxlat
minlat

# define map coordinates - take extremes and add a mile
location <- c(minlon-1/69, minlat-1/69, maxlon+1/69, maxlat+1/69)

# Fetch the map
chicago <- get_map(location = location, source = "osm")
#chicago <- get_map(location = location)


# Draw the map
chicagoMap <- ggmap(chicago)
ggmap(chicago)


# define lat and longitude of vacancy violations by year
vacancy2006 <- na.omit(data.frame(longitude=data[v2006,21],latitude=data[v2006,20]))
vacancy2007 <- na.omit(data.frame(longitude=data[v2007,21],latitude=data[v2007,20]))
vacancy2008 <- na.omit(data.frame(longitude=data[v2008,21],latitude=data[v2008,20]))
vacancy2009 <- na.omit(data.frame(longitude=data[v2009,21],latitude=data[v2009,20]))
vacancy2010 <- na.omit(data.frame(longitude=data[v2010,21],latitude=data[v2010,20]))
vacancy2011 <- na.omit(data.frame(longitude=data[v2011,21],latitude=data[v2011,20]))
vacancy2012 <- na.omit(data.frame(longitude=data[v2012,21],latitude=data[v2012,20]))
vacancy2013 <-na.omit( data.frame(longitude=data[v2013,21],latitude=data[v2013,20]))
vacancy2014 <- na.omit(data.frame(longitude=data[v2014,21],latitude=data[v2014,20]))
vacancy2015 <- na.omit(data.frame(longitude=data[v2015,21],latitude=data[v2015,20]))


# plot vacancy violations by year on a map of the city
# Add the points layer
chicagoMap2006 = chicagoMap + geom_point(data = vacancy2006, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2006

# Add the points layer
chicagoMap2007 = chicagoMap + geom_point(data = vacancy2007, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2007

# Add the points layer
chicagoMap2008 = chicagoMap + geom_point(data = vacancy2008, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2008

# Add the points layer
chicagoMap2009 = chicagoMap + geom_point(data = vacancy2009, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2009

# Add the points layer
chicagoMap2010 = chicagoMap + geom_point(data = vacancy2010, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2010

# Add the points layer
chicagoMap2011 = chicagoMap + geom_point(data = vacancy2011, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2011

# Add the points layer
chicagoMap2012 = chicagoMap + geom_point(data = vacancy2012, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2012

# Add the points layer
chicagoMap2013 = chicagoMap + geom_point(data = vacancy2013, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2013

# Add the points layer
chicagoMap2014 = chicagoMap + geom_point(data = vacancy2014, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2014

# Add the points layer
chicagoMap2015 = chicagoMap + geom_point(data = vacancy2015, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2015



# define row vectors of vacancy REPORTS by year
v22006<-grep("*2006",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22006)
v22007<-grep("*2007",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22007)
v22008<-grep("*2008",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22008)
v22009<-grep("*2009",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22009)
v22010<-grep("*2010",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22010)
v22011<-grep("*2011",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22011)
v22012<-grep("*2012",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22012)
v22013<-grep("*2013",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22013)
v22014<-grep("*2014",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22014)
v22015<-grep("*2015",data311$DATE.SERVICE.REQUEST.WAS.RECEIVED)
length(v22015)


# define lat and long of vacancy reports by year
vacancy3112008 <- data.frame(longitude=data[v22008,21],latitude=data[v22008,20])
vacancy3112009 <- data.frame(longitude=data[v22009,21],latitude=data[v22009,20])
vacancy3112010 <- data.frame(longitude=data[v22010,21],latitude=data[v22010,20])
vacancy3112011 <- data.frame(longitude=data[v22011,21],latitude=data[v22011,20])
vacancy3112012 <- data.frame(longitude=data[v22012,21],latitude=data[v22012,20])
vacancy3112013 <- data.frame(longitude=data[v22013,21],latitude=data[v22013,20])
vacancy3112014 <- data.frame(longitude=data[v22014,21],latitude=data[v22014,20])
vacancy3112015 <- data.frame(longitude=data[v22015,21],latitude=data[v22015,20])




# plot 311 reported vacancies

# Add the points layer
chicagoMap2009 = chicagoMap + geom_point(data = vacancy3112009, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2009
#chicagoMap2009 = chicagoMap + geom_point(data = vacancy3112009, aes(x = longitude, y = latitude), size = 3)+ geom_point(data = vacancy2009, aes(x = longitude, y = latitude), size = 3)
#chicagoMap2009
# Add the points layer
chicagoMap2010 = chicagoMap + geom_point(data = vacancy3112010, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2010

# Add the points layer
chicagoMap2011 = chicagoMap + geom_point(data = vacancy3112011, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2011

# Add the points layer
chicagoMap2012 = chicagoMap + geom_point(data = vacancy3112012, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2012

# Add the points layer
chicagoMap2013 = chicagoMap + geom_point(data = vacancy3112013, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2013

# Add the points layer
chicagoMap2014 = chicagoMap + geom_point(data = vacancy3112014, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2014

# Add the points layer
chicagoMap2015 = chicagoMap + geom_point(data = vacancy3112015, aes(x = longitude, y = latitude), size = 3,na.rm=TRUE)
chicagoMap2015


###   combined vacancy events lat and lon

vaca2008<-rbind(vacancy3112008,vacancy2008)
dim(vaca2008)

vaca2009<-rbind(vacancy3112009,vacancy2009)
dim(vaca2009)

vaca2010<-rbind(vacancy3112010,vacancy2010)
dim(vaca2010)

vaca2011<-rbind(vacancy3112011,vacancy2011)
dim(vaca2011)

vaca2012<-rbind(vacancy3112012,vacancy2012)
dim(vaca2012)

vaca2013<-rbind(vacancy3112013,vacancy2013)
dim(vaca2013)

vaca2014<-rbind(vacancy3112014,vacancy2014)
dim(vaca2014)

vaca2015<-rbind(vacancy3112015,vacancy2015)
dim(vaca2015)

### how big is the area we're working with?
(maxlon-minlon)*69    
(maxlat-minlat)*69   

# mi length lat square
# mi length lon square

lonlines<-seq(from=minlon,to=maxlon,by=((1/69)*lonmi))
latlines<-seq(from=minlat,to=maxlat,by=((1/69)*latmi))

length(lonlines)
length(latlines)

# total number of squares
(length(lonlines)-1)*(length(latlines)-1)


# assign each vacancy a grid point
head(lonlines)
for(i in 1:nrow(vaca2009))    vaca2009[i,3]<-max(which(lonlines<=vaca2009[i,1]))
for(i in 1:nrow(vaca2009))    vaca2009[i,4]<-max(which(latlines<=vaca2009[i,2]))
vaca2009[,5]<-vaca2009[,3]*100+vaca2009[,4]
head(vaca2009)
length(unique(vaca2009[,5]))


for(i in 1:nrow(vaca2010))    vaca2010[i,3]<-max(which(lonlines<=vaca2010[i,1]))
for(i in 1:nrow(vaca2010))    vaca2010[i,4]<-max(which(latlines<=vaca2010[i,2]))
vaca2010[,5]<-vaca2010[,3]*100+vaca2010[,4]
head(vaca2010)
length(unique(vaca2010[,5]))

for(i in 1:nrow(vaca2011))    vaca2011[i,3]<-max(which(lonlines<=vaca2011[i,1]))
for(i in 1:nrow(vaca2011))    vaca2011[i,4]<-max(which(latlines<=vaca2011[i,2]))
vaca2011[,5]<-vaca2011[,3]*100+vaca2011[,4]
head(vaca2011)
length(unique(vaca2011[,5]))

for(i in 1:nrow(vaca2012))    vaca2012[i,3]<-max(which(lonlines<=vaca2012[i,1]))
for(i in 1:nrow(vaca2012))    vaca2012[i,4]<-max(which(latlines<=vaca2012[i,2]))
vaca2012[,5]<-vaca2012[,3]*100+vaca2012[,4]
head(vaca2012)
length(unique(vaca2012[,5]))

for(i in 1:nrow(vaca2013))    vaca2013[i,3]<-max(which(lonlines<=vaca2013[i,1]))
for(i in 1:nrow(vaca2013))    vaca2013[i,4]<-max(which(latlines<=vaca2013[i,2]))
vaca2013[,5]<-vaca2013[,3]*100+vaca2013[,4]
head(vaca2013)
length(unique(vaca2013[,5]))

for(i in 1:nrow(vaca2014))    vaca2014[i,3]<-max(which(lonlines<=vaca2014[i,1]))
for(i in 1:nrow(vaca2014))    vaca2014[i,4]<-max(which(latlines<=vaca2014[i,2]))
vaca2014[,5]<-vaca2014[,3]*100+vaca2014[,4]
head(vaca2014)
length(unique(vaca2014[,5]))

for(i in 1:nrow(vaca2015))    vaca2015[i,3]<-max(which(lonlines<=vaca2015[i,1]))
for(i in 1:nrow(vaca2015))    vaca2015[i,4]<-max(which(latlines<=vaca2015[i,2]))
vaca2015[,5]<-vaca2015[,3]*100+vaca2015[,4]
head(vaca2015)
length(unique(vaca2015[,5]))


#  Define union of oppupied grid squares
unionSeveral <- function(...) { Reduce(union, list(...)) } 
usqr<-unionSeveral(vaca2013[,5],vaca2015[,5],vaca2014[,5],vaca2012[,5],vaca2011[,5],vaca2010[,5],vaca2009[,5])
length(usqr)

# define intersection of ocupied grid squares
intersectSeveral <- function(...) { Reduce(intersect, list(...)) } 
isqr<-intersectSeveral(vaca2013[,5],vaca2015[,5],vaca2014[,5],vaca2012[,5],vaca2011[,5],vaca2010[,5],vaca2009[,5])
length(isqr)



# length of intersetion of non-zero quadrants  across years
length(isqr)

# length of union of non-zero quadrants across years
length(usqr)

#quadrant corners
qcorners<-expand.grid(lonlines,latlines)
colnames(qcorners)<-c("longitude","latitude")

# plot quadrant corners
chicagoGrid <- chicagoMap + geom_point(data = qcorners, aes(x = longitude, y = latitude), size = 1)
chicagoGrid


#  add year to vacancy matrix
vaca2009[,6]<-2009
vaca2010[,6]<-2010
vaca2011[,6]<-2011
vaca2012[,6]<-2012
vaca2013[,6]<-2013
vaca2014[,6]<-2014
vaca2015[,6]<-2015

#  bind all vacancy events - creeate table
vacancyevents<- rbind(vaca2009,vaca2010,vaca2011,vaca2012,vaca2013,vaca2014,vaca2015)
head(vacancyevents[,5],vacancyevents[,6])
vacancyevents[,7]<-paste(vacancyevents[,5],vacancyevents[,6])
tabl<-table(vacancyevents[,5:6])
head(tabl,50)

# plot all vacancy event on a chrt of the city
chicagoMapVacancyEvents = chicagoMap + geom_point(data = vacancyevents, aes(x = longitude, y = latitude), size = 2)+geom_point(data = qcorners, aes(x = longitude, y = latitude), size = 1,col="red")
chicagoMapVacancyEvents


#  sum table columns
apply(tabl,2,sum)
dim(vacancyevents)
head(vacancyevents)



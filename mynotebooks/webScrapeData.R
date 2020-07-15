#use Dataminer extension on Chrome to scrape Chicago Covid-19 cases and deaths table from webpage

library(rvest)
url<-"https://www.chicago.gov/city/en/sites/covid-19/home/latest-data.html"
population<-url%>%
  read_html()%>%
  html_nodes(xpath='//div[2]/div/div/div[1]/div[1]/div/div/div/table') %>%
  html_table()
population<-population[[1]]
population<-population[-NROW(population),]

population$CASES1<-as.numeric(str_replace_all(population$CASES1,",",""))
population$DEATHS<-as.numeric(str_replace_all(population$DEATHS,",",""))

par(mfrow=c(1,2))
par(mar=c(5,15,4,4))
barplot(height=population$CASES1,names.arg=population$GEOGRAPHY, horiz = T, las=2,main="Cases")
barplot(height=population$DEATHS, names.arg=population$GEOGRAPHY, horiz = T, las=2,main="Deaths")

#now scrape a different table from the site
characteristics<-url%>%
  read_html()%>%
  html_nodes(xpath='//div[2]/div/div/div/div/div/table') %>%
  html_table()
characteristics<-characteristics[[1]]

if(!require(shiny)) install.packages("shiny")
require(shiny)

runApp("C:\\Users\\Nils\\Documents\\GitHub\\R-code\\Coursera\\Data Products\\DataProductsProject")

# if(!require(rsconnect)) install.packages("rsconnect")
# require(rsconnect)
# 
# 
# rsconnect::setAccountInfo(name='nsen',
#                           token='E09390634CDCB94A81AD83034CCE6EEE',
#                           secret='Ts7CzyZD+AY3UYkOW9YWAn3oHft87s6pjy1UR7Gk')

# rsconnect::deployApp('path/to/your/app')

#Install TaskScheduler
# install.packages('data.table')
# install.packages('knitr')
# 
# install.packages("taskscheduleR", repos = "http://www.datatailor.be/rcube", type = "source")
# install.packages('miniUI')
# install.packages('shiny')


#Cleanup Memory
odbcCloseAll()
rm(list=ls())
gc()
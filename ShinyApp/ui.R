#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Conditional Panel for Doccumentation: http://shiny.rstudio.com/reference/shiny/latest/conditionalPanel.html

if(!require(shiny)) install.packages("shiny")
require(shiny)

if(!require(lattice)) install.packages("lattice")
require(lattice)

if(!require(data.table)) install.packages("data.table")
require(data.table)

if(!require(xts)) install.packages("xts")
require(xts)

if(!require(quantmod)) install.packages("quantmod")
require(quantmod)


#Load Data
if(!exists("xtsGDPtax.percent")){
  load(file = "GDPtaxpercent.RData")
}

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("US GDP and Federal Tax Collections"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      shiny::sliderInput(inputId = "yearinterval", "Year Interval:", min = 1950, max = 2014, value = c(1950,2014), sep = ""),
      
      shiny::checkboxGroupInput(inputId = "ChartType", label = "Options:",
                                 choices = list("Bollinger Bands"="BBD"), selected = c("MAV")),
      shiny::fluidRow(
        shinydashboard::box(title = "", "", 
                                          shiny::actionButton(inputId='ab1', label="Documentation", 
                                                              icon = icon("th"), 
                                                              onclick ="window.open('ProjectDocumentation.html', '_blank')")
                                          )
    
        )
      ),
    
    # Show a plot of the generated distribution
    mainPanel(style = "overflow-y:scroll; max-height: 800px",
       plotOutput("Plot.tcp"),
       plotOutput("Plot.tc")
    )
  )
))

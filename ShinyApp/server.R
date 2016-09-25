#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  #Load Data
  if(!exists("xtsGDPtax.percent")){
    load(file = "GDPtaxpercent.RData")
  }

  output$Plot.tcp <- renderPlot({
    StEnDates <- paste(paste(as.character(input$yearinterval[1]),"01","01", sep="-"), 
                       paste(as.character(input$yearinterval[2]),"12","31",sep="-"), sep = "/")
    chartSeries((xtsGDPtax.percent$TaxPercentofGDP*100)[StEnDates], type = "line", name = "Federal Tax as Percent \n of GDP", theme = "white", ylab="Test")
    #if(any(input$ChartType == "MAV")) {addSMA(n=3)}
    if(any(input$ChartType == "BBD")) {addBBands(n=3, sd=2, ma = "SMA", draw = "bands", on =-1)}
    #browser()
  }) 
  
  output$Plot.tc <- renderPlot({
    StEnDates <- paste(paste(as.character(input$yearinterval[1]),"01","01", sep="-"),
                       paste(as.character(input$yearinterval[2]),"12","31",sep="-"), sep = "/")
    chartSeries(xtsGDPtax.percent$TaxCollections[StEnDates], type = "line", name = "Federal Tax Collections \n (millions)", theme = "white", ylab="Millions")
    if(any(input$ChartType == "BBD")) {addBBands(n=3, sd=2, ma = "SMA", draw = "bands", on =-1)}
    
  })
  
})

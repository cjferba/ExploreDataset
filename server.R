library(shiny)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    dat<-bank$input$Feature
    na<-input$Feature
  })
  output$plot1 <- renderPlot({
    if(input$Graf_Bank=="Histograma"){
      ggplot(bank, aes_string(x=input$Feature)) + geom_histogram()
    }
  })
  
})



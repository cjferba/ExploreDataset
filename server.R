library(shiny)
# require(devtools)
# library(rCharts)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    data<-bank[,input$Feature]
    names<-input$Feature
  })
  
  output$plot1 <- renderPlot({
    ggplot(bank, aes(names)) + geom_histogram()
    
    # ggplot(data, aes_string(x=input$xcol, y=input$xcol)) + geom_line()
#     p <- ggplot(data,aes(x =data[,1] , y=data[,2],fill=data[,2]))+
#       geom_bar(colour = "black",stat="identity")
#     p +coord_cartesian(ylim = c(0.42, 0.48)) +
#       labs(x = "Metodo", y = "Error",title="NN python vs Ensamble")+
#       scale_fill_gradient2(limits=c(0.42, 0.48),midpoint =0.45 ,
#                            low="green",mid="yellow" , high="red")
#     p
  })
  
})



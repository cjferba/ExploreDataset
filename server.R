library(shiny)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
#     s<-unlist(strsplit(input$Feature2, split=" "))
#     print(s)
#     print (sum(names(bank)  == s))
#     bank[,names(bank)  == s]
    # bank[[input$Feature]]
    datos <- rbind(data.frame(Feature=input$Feature, feature=bank[[input$Feature]]),
                data.frame(Feature=input$Feature2, feature=bank[[input$Feature2]]))
    datos
  })
  
  
  output$Histogram <- renderPlot({
    # if(input$Graf_Bank=="Histograma"){
      # ggplot(bank, aes_string(x=input$Feature)) + geom_histogram()
    print (str(selectedData()))
      ggplot(selectedData(), aes(x=feature, fill = Feature)) +geom_density(alpha = 0.8)
#     }else{
#       ggplot(bank,aes_string(x=1, y=input$Feature)) + 
#         geom_boxplot(aes_string(fill=1)) +
#         theme(legend.position = "none")
#       b3<-ggplot(bank, aes(x = input$Feature)) +
#         stat_density(aes(ymax = ..density..,  ymin = -..density..,
#                          fill = 1, color = 1),
#                      geom = "ribbon", position = "identity") +
#         facet_grid(. ~ bank[[input$Feature]]) +
#         coord_flip() +
#         theme(legend.position = "none")
      
    # }
  })
  # Generate a summary of the data
  output$summary <- renderPrint({
    summary(selectedData())
  })
#   
  # Generate an HTML table view of the data
   output$Table <- renderTable({
     selectedData()
   })
  
})



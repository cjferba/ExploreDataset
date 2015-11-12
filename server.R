library(shiny)
library(ggplot2)

shinyServer(function(input, output, session) {
  
  
  
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    #########################          BANK           #########################   
    datos_bank <- rbind(data.frame(Feature=input$Feature, feature=bank[[input$Feature]]),
                data.frame(Feature=input$Feature2, feature=bank[[input$Feature2]]))
    datos_bank
    #########################    FOREST EQUIDEPTH     #########################   
#     datos_fe <- rbind(data.frame(Feature=input$Feature_fe, feature=bank[[input$Feature_fe]]),
#                    data.frame(Feature=input$Feature2_fe, feature=bank[[input$Feature2_fe]]))
#     
#     list(datos_bank,datos_bank)
  })
  
  output$information <- renderPrint({
    "Seleccione un conjunto de datos"
  })
  
  
  ################################################################################# 
  ###                           Component 1                                     ###
  #################################################################################                   
    output$Histogram <- renderPlot({
    # if(input$Graf_Bank=="Histograma"){
      # ggplot(bank, aes_string(x=input$Feature)) + geom_histogram()
    print("bien")
    datos_bank <- rbind(data.frame(Feature=input$Feature, feature=bank[[input$Feature]]),
                      data.frame(Feature=input$Feature2, feature=bank[[input$Feature2]]))
    print("bien")
    ggplot(datos_bank, aes(x=feature, fill = Feature)) +geom_density(alpha = 0.8)
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
    tipos<-unique(selectedData()[["Feature"]])
    if (length(tipos)==1) {
      s<-data.frame(rbind(c(name=input$Feature,summary(selectedData()[1][selectedData()[1][["Feature"]]==tipos[1],2]))))
    }else{
      s<-data.frame(cbind(name=c(input$Feature,input$Feature2),rbind(summary(selectedData()[1][selectedData()[1][["Feature"]]==tipos[1],2]),
                                                     summary(selectedData()[1][selectedData()[1][["Feature"]]==tipos[2],2]))))
    }
 
    s
  })
#   
  # Generate an HTML table view of the data
   output$Table <- renderTable({
     selectedData()[1]
   })
  
   
   ################################################################################# 
   ###                           Component 2                                     ###
   #################################################################################                   
   
   output$Histogram <- renderPlot({
     ggplot(selectedData()[2], aes(x=feature, fill = Feature)) +geom_density(alpha = 0.8)
   })
   # Generate a summary of the data
   output$summary <- renderPrint({
     tipos<-unique(selectedData()[["Feature"]])
     if (length(tipos)==1) {
       s<-data.frame(rbind(c(name=input$Feature,summary(selectedData()[selectedData()[["Feature"]]==tipos[1],2]))))
     }else{
       s<-data.frame(cbind(name=c(input$Feature,input$Feature2),rbind(summary(selectedData()[selectedData()[["Feature"]]==tipos[1],2]),
                                                                      summary(selectedData()[selectedData()[["Feature"]]==tipos[2],2]))))
     }
     
     s
   })
   #   
   # Generate an HTML table view of the data
   output$Table <- renderTable({
     selectedData()
   })
})



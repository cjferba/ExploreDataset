library(shiny)
library(ggplot2)

#data<-read.csv("Data/FitnessDeepLearning.csv")
bank<-read.csv(paste("Data/fuzzy/bank.csv"))
#german<-read.csv(paste("Data/fuzzy/german.csv"))
#forest_equidepth<-read.csv(paste("Data/fuzzy/forest-equidepth.csv"))
#bank<-read.csv(paste("Data/fuzzy/bank.csv"))

shinyUI(navbarPage("Analisis de Dataset",
                   ################################################################################# 
                   ###                           Component 1                                     ###
                   #################################################################################                   
                   tabPanel("Dataset_Bank",headerPanel('Histogram of dataset'),
                            sidebarPanel(
                              selectInput("Graf_Bank", "Choose:", 
                                          choices = c("Histograma","blo")),
                              selectInput("Feature", "Choose:", 
                                          choices = c(names(bank)))
                            ),
                            mainPanel(
                              plotOutput('plot1')
                            )
                   ),
                   
                   #################################################################################                   
                   ###                           Component 2                                     ###
                   #################################################################################                   
                  # tabPanel("Component 2",
                           # selectInput("dataset", "Choose a dataset:", 
                            #            choices = c("fuzzy/","crisp/")
                            #            ),
                   #         mainPanel(
                             # plotOutput('plot1')
                    #        )
                     #       ),
                   navbarMenu("More",
                              tabPanel("Sub-Component A"),
                              tabPanel("Sub-Component B"))
))
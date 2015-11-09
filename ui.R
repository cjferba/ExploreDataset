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
                              selectInput("Feature", "Choose for histogram:", 
                                          choices = c(names(bank))),
                              selectInput("Feature2", "Choose for plot:", 
                                          choices = c(names(bank)))
                            ),
                            mainPanel(
                               tabsetPanel(
                                  tabPanel("Histogram", plotOutput("Histogram")), 
#                                 tabPanel("boxplot", tableOutput("table")),
                                  tabPanel("Summary", verbatimTextOutput("summary")),
                                  tabPanel("Table", tableOutput("Table"))
                                  )
                          )
                  ) # ),
                   
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
#                    navbarMenu("More",
#                               tabPanel("Sub-Component A"),
#                               tabPanel("Sub-Component B"))
))
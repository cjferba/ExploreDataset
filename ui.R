library(shiny)
library(ggplot2)

#data<-read.csv("Data/FitnessDeepLearning.csv")
bank<-read.csv(paste("Data/fuzzy/bank.csv"))
#german<-read.csv(paste("Data/fuzzy/german.csv"))
forest_equidepth<-read.csv(paste("Data/fuzzy/forest-equidepth.csv"))
#bank<-read.csv(paste("Data/fuzzy/bank.csv"))

shinyUI(navbarPage("Analisis de Dataset",
                   ################################################################################# 
                   ###                           Component 1                                     ###
                   #################################################################################                   
                   tabPanel("Dataset_Bank",headerPanel('Dataset Bank'),
                            sidebarPanel(
                              selectInput("Feature", "feature one:", 
                                          choices = c(names(bank))),
                              selectInput("Feature2", "Feature second:", 
                                          choices = c(names(bank)))
                            ),
                            mainPanel(
                               tabsetPanel(
                                  tabPanel("Histogram", plotOutput("Histogram")), 
                                 tabPanel("boxplot", tableOutput("table")),
                                  tabPanel("Summary", verbatimTextOutput("summary")),
                                  tabPanel("Table", tableOutput("Table"))
                                  )
                          )
                    ),
                   
                   #################################################################################                   
                   ###                           Component 2                                     ###
                   #################################################################################                   
                  tabPanel("Dataset forest_equidepth",
                           sidebarPanel(
                             selectInput("Feature_fe", "feature one:", 
                                         choices = c(names(forest_equidepth))),
                             selectInput("Feature2__fe", "Feature second:", 
                                         choices = c(names(forest_equidepth)))
                           ),
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Histogram", plotOutput("Histogram_2")), 
                               tabPanel("boxplot", tableOutput("table_2")),
                               tabPanel("Summary", verbatimTextOutput("summary_2")),
                               tabPanel("Table", tableOutput("Table_2"))
                             )
                           )
                           ),
                  #################################################################################                   
                  ###                           Component 3                                     ###
                  #################################################################################                   
                  tabPanel("Dataset German",
                           sidebarPanel(
                             selectInput("Feature_Ge", "feature one:", 
                                         choices = c(names(forest_equidepth))),
                             selectInput("Feature2__Ge", "Feature second:", 
                                         choices = c(names(forest_equidepth)))
                           ),
                           mainPanel(
                             tabsetPanel(
                               tabPanel("Histogram", plotOutput("Histogram_2")), 
                               tabPanel("boxplot", tableOutput("table_2")),
                               tabPanel("Summary", verbatimTextOutput("summary_2")),
                               tabPanel("Table", tableOutput("Table_2"))
                             )
                           )
                  ),
                   navbarMenu("More",
                              tabPanel("Sub-Component A"),
                              tabPanel("Sub-Component B"))
))
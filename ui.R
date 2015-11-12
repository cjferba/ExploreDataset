library(shiny)
library(ggplot2)

#data<-read.csv("Data/FitnessDeepLearning.csv")
if(!("bank" %in% ls())){
  bank<-read.csv(paste("Data/fuzzy/bank.csv"))
}
if(!("forest_equidepth" %in% ls())){
  forest_equidepth<-read.csv(paste("Data/fuzzy/forest-equidepth.csv"))
}
#if(!("bank" %in% ls())){}
#german<-read.csv(paste("Data/fuzzy/german.csv"))
#bank<-read.csv(paste("Data/fuzzy/bank.csv"))

shinyUI(navbarPage("Analisis de Dataset",
                   ################################################################################# 
                   ###                           Component 1                                     ###
                   #################################################################################                   
                   tabPanel("Summary", verbatimTextOutput("Information"),),
                   navbarMenu("Fuzzy",
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
                    )),
                   
                   #################################################################################                   
                   ###                           Component 2                                     ###
                   #################################################################################                   
#                   tabPanel("Dataset forest_equidepth",
#                            sidebarPanel(
#                              selectInput("Feature_fe", "feature one:", 
#                                          choices = c(names(forest_equidepth))),
#                              selectInput("Feature2__fe", "Feature second:", 
#                                          choices = c(names(forest_equidepth)))
#                            ),
#                            mainPanel(
#                              tabsetPanel(
#                                tabPanel("Histogram1", plotOutput("Histogram_2")), 
#                                tabPanel("boxplot1", tableOutput("table_2")),
#                                tabPanel("Summary1", verbatimTextOutput("summary_2")),
#                                tabPanel("Table1", tableOutput("Table_2"))
#                              )
#                            )
#                            ),
                  #################################################################################                   
                  ###                           Component 3                                     ###
                  #################################################################################                   
#                   tabPanel("Dataset German",
#                            sidebarPanel(
#                              selectInput("Feature_Ge", "feature one:", 
#                                          choices = c(names(forest_equidepth))),
#                              selectInput("Feature2__Ge", "Feature second:", 
#                                          choices = c(names(forest_equidepth)))
#                            ),
#                            mainPanel(
#                              tabsetPanel(
#                                tabPanel("Histogram2", plotOutput("Histogram_2")), 
#                                tabPanel("boxplot2", tableOutput("table_2")),
#                                tabPanel("Summary2", verbatimTextOutput("summary_2")),
#                                tabPanel("Table2", tableOutput("Table_2"))
#                              )
#                            )
#                   ),
                   navbarMenu("Crisp",
                              tabPanel("Sub-Component A"),
                              tabPanel("Sub-Component B"))
))
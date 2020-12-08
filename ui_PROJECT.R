
#setup
library(tidyverse)
library(shiny)
library(ggplot2)
library(plotly)

source("aggregate_table.R")
source("pie_chart_age_demographic.R")
source("scatterplot_time_on_social_media.R")
source("Summary.R")
source("bar_chart_gender_dif_Q5.R")
source("scatterplot_Q1_Q3.R")



# UI setup
shinyUI(
    
    ui <-
    
    fluidPage(
    
    tabsetPanel(
        
        
        tabPanel("Title", 
                 
        pageWithSidebar(  
        
            headerPanel("Anxiety Data"),
            
            sidebarPanel("Types of Information", x_input),
                 
                 
                 mainPanel("test", bar_plot_by_tony )),
        
        tabPanel("pie chart", mainPanel(pie_chart_output))
        
        
        
        
        )
    )
)
)



pie_chart_output <- plotlyOutput("piechart")







#experiment 
col_names <- colnames(aggregate_table)

x_input <- selectInput(
    inputId = "x_input",
    label = "Choose a value",
    choices = col_names
)

bar_plot_by_tony <- plotOutput("barplot")






            
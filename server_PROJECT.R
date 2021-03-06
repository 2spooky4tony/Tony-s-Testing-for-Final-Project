
#setup
library(tidyverse)
library(shiny)
library(ggplot2)
library(plotly)



# Turning Aggregate table in Bar Chart

server <- function(input, output) {
    output$barplot <- renderPlot({
   ggplot(aggregate_table, aes_string(x="Age", y = input$x_input, fill= "Age")) +
        geom_bar(stat='identity')
        
    })    

    
  
# Creating the Piechart    
    
      output$piechart <- renderPlotly({
        plot_ly(
            data = age_demographic,
            labels = ~Age,
            values = ~n,
            type = "pie",
            hovertext = "Ages"
        ) %>%
            layout(
                title = "Age demographic of social anxiety survey",
                xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
            )
        
        
    })
    
}












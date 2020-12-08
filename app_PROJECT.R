
#setup
library(tidyverse)
library(shiny)
library(ggplot2)
library(plotly)

source("server_PROJECT.R")
source("ui_PROJECT.R")


# Run the application 
shinyApp(ui = ui, server = server)


#R Coding

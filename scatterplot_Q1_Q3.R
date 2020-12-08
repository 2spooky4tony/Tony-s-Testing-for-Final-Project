library('plotly')
library(ggplot2)

social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)

anxiety_plot <- ggplot(data = social_anxiety) +
  geom_point(mapping = aes(x = Q3, y = Q1, color = 'Blue'))

ggplotly(anxiety_plot)

plot_ly(
  data = social_anxiety,
  x = ~Q3,
  y = ~Q1,
  type = "scatter",
  mode = "markers"
) %>% 
  layout(
    title = "Relationshipt between amounts of socail media usages and comfortable levels to be center of attention",
    xaxis = list(title = "how do you feel being the center of attention?"),
    yaxis = list(title = "How many hours per day do you spend on socail media?")
  )

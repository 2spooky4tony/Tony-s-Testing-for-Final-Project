library(tidyverse)
library(plotly, warn.conflicts = F, quietly = T);
social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)

age_demographic <- social_anxiety %>%
  group_by(Age) %>%
  count()

by_age <- as.data.frame(table(social_anxiety$Age))



pie_chart_age <- plot_ly(
  data = age_demographic,
  labels = ~Age,
  values = ~n,
  type = "pie",
  hovertext = "y"
) %>%
  layout(
    title = "Age demographic of social anxiety survey",
    xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
    yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
  )



# install.packages("plotly")
library("plotly")  
library(ggplot2)

social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)

gender_dif <- social_anxiety %>% 
  group_by(Gender) %>% 
  summarize(anxiety_mean = round(mean(Q5)))

by_gender <- as.data.frame(table(social_anxiety$Gender))

plot_ly(
  data = gender_dif,
  x = ~Gender, 
  y = ~anxiety_mean,
  type = "bar",
  alpha = .6,
  hovertext = "y"
) %>% 
  layout(
    title = "Mean scale of talking face to face with someone you don't know vell well based on gender difference",
    xaxis = list(title = "Gender"),
    yaxis = list(title = "Number of Confotable levels")
  )



# To render chart in R Markdown:

gender_dif_chart <- ggplot(data = gender_dif) +
  geom_col(mapping = aes(x = Gender, y = anxiety_mean)) +
  labs(
    title = "Mean comfortability of talking face-to-face with someone you don't know well based on gender",
    x = "Gender",
    y = "Number of Comfortable levels"
  )
  
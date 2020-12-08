library(tidyverse)

social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)

hours_on_social_media <- social_anxiety %>% 
  group_by(Q1) %>%
 count()

students <- social_anxiety %>% 
  left_join(hours_on_social_media, by = "Q1") %>% 
  filter(Student == "Yes") 



students_on_social_media_plot <- ggplot(data = students) +
  geom_point(mapping = aes(x = Q1, y = n))+
  coord_flip() +
  labs(
    title = "Student's Time Spent on Social Media",
    x = "Hours on Social Media",
    y = "Students"
  )




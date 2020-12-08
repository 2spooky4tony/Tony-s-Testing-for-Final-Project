library(tidyverse)
library(stringr)

social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)

aggregate_table <- social_anxiety %>%
  group_by(Age)%>%
  summarise(round(across(everything(), list(mean))))
#aggregate_table = round(aggregate_table[, -1], 0)
aggregate_table = select(aggregate_table, 1, 7:11)


aggregate_table %>% mutate_at(vars(Q2_1, Q3_1, Q4_1, Q5_1, Q6_1), funs(round(., 0)))

colnames(aggregate_table) <- c ("Age", "How many hours per day do you spend on social media?",
                       "How do you feel being the center of attention?",
                        "Working while being observed", 
                        "Talking face to face with someone you don't know very well",
                        "Expressing disagreement or disapproval to someone you don't know very well",
                       "Are you extremely conscious of your actions when in social settings 
                        because you fear they might offend someone or you could be rejected?")

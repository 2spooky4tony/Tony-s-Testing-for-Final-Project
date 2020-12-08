library(tidyverse)
library(stringr)

social_anxiety <- read.csv(file = 'Social_Anxiety_Survey_Master.csv', stringsAsFactors = F)


summary_info <- list()
summary_info$num_observations <- nrow(social_anxiety)
summary_info$max_age <- social_anxiety %>%
  filter(Age == max(Age, na.rm = T)) %>%
  slice(1) %>%
  select(Age)

summary_info$min_age <- social_anxiety %>%
  filter(Age == min(Age, na.rm = T)) %>%
  slice(1) %>%
  select(Age)

summary_info$sum_lowest_hours_per_day_on_social_media <-
  sum(str_detect(social_anxiety$Q1, "Less than 1 hours per day"))

summary_info$sum_highest_hours_per_day_on_social_media <-
  sum(str_detect(social_anxiety$Q1, "4 hours and above per day"))

summary_info$num_of_students <- 
  sum(str_detect(social_anxiety$Student, "Yes"))

summary_info$not_A_student <- 
  sum(str_detect(social_anxiety$Student, "No"))
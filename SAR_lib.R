
# SAR LIBRARY -------------------------------------------------------------

# Takes raw input from the SAR data entry survey (to be completed by SABs)
# and undertakes aggregate analyses with a view to creating an online tool
# for exploring SARs across English LAs and learning from these. 


# Prep --------------------------------------------------------------------

library(tidyverse)
library(lubridate)


# Import ------------------------------------------------------------------

reviews <- 
  read_csv("SAR_data.csv", 
           na = c('','-', 'N/A', 'NA'), 
           trim_ws = TRUE)


# Clean -------------------------------------------------------------------

# gather data for tidy analysis
tidy_reviews <- 
  reviews %>% 
  gather(question, value, -UserID) %>% 
  filter(!is.na(value)) %>% 
  rename(user_id = UserID)

# replace yes / no for binary
tidy_reviews <- 
  tidy_reviews %>% 
  mutate(value = str_replace(value, '^Yes$', '1'),
         value = str_replace(value, '^No$', '0'))

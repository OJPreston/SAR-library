####################################################
# Prepare workspace
####################################################

library(tidyverse)
library(readxl)

####################################################
# Import
####################################################

# start with blank table of column names
sardata <- read_excel("sardata.xlsx", sheet = 1) 

# work in a subfolder containing all individual SARs
wd <- getwd()
setwd(paste(wd,"/SARs", sep = ''))

# import all individual SARs
listFilenames <- list.files(pattern=".xlsx$")
listData <- list()
for (i in 1:length(listFilenames)) {
  listData[[i]]<-read_excel(listFilenames[i], sheet = 1)
  }

# import each new entry to sardata

for (i in 1:length(listData)) {
  x <- nrow(sardata) + 1 # row number of the new entry (underneath all current entries) 
  sardata[x,] <- as.data.frame(listData[i]) %>% t() %>% .[2,]
}

# update ID numbers - need better way to do this
sardata$`SAR ID`<-1:nrow(sardata)

# return to main wd
setwd(wd)

####################################################
# Tidy
####################################################

# source of referral
sardata %>% 
  select(5)

# type of abuse
sardata %>% 
  select(132:143)

# source of abuse
sardata %>% 
  select(144:149)

#location of abuse
sardata %>% 
  select(111:131)

# questions about mental capacity
sardata %>% 
  select(158:159)

# age
sardata %>% 
  select(83:89)

# gender
sardata %>% 
  select(69:72)

# region
sardata %>% 
  select(2)

# care needs
sardata %>% 
  select(150:157)

# living situation
sardata %>% 
  select(99:108) %>% View()

# sexual orientation
sardata %>% 
  select(73:76)

# religion
sardata %>% 
  select(90:98)

# process / structure used

# method
43:44
# submitted documents
# subect invited
# subject involved 
# family members invited

####################################################
# Visualise
####################################################




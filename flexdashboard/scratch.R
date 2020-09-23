
library(flexdashboard)
library(tidyverse)

reporting <- read_csv("2019_rms_reporting_compliance_2020-07-30.csv")
names(reporting) <- tolower(names(reporting))



reporting %>% 
    filter(water_right_status %in% c("Licensed", 
                                     "Permitted", "
                                     Certified",
                                     "Registered", 
                                     "Claimed")) %>% 
    group_by(water_right_type) %>% 
    summarize(completeness = sum(!is.na(date_report_filed)) / n())
    

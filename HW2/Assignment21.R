getwd()
library(tidyverse)
library(tidyr)
library(plyr)
read.csv("coviddirty.csv")
hw21  <- read.csv("coviddirty.csv")
hw21_select <- select(hw21, c(TRUDP105R, CNRNCMCV1, TRSTCV1A, TRSTCV1B, TRSTCV1D, PARTYID)) 

table(hw21_select$TRUDP105R)
hw21_select <- hw21_select %>%
  dplyr::mutate(TRUDP105R_recode = dplyr::recode(TRUDP105R, 'Vol: Unsure' = NA_character_)) #I couldn't figure out how to remove empty values.
levels(hw21_select$TRUDP105R_recode)
str(hw21_select$TRUDP105R_recode)
table(hw21_select$TRUDP105R_recode) 
hw21_select$TRUDP105R_recode <- forcats::fct_relevel(hw21_select$TRUDP105R_recode, "Strongly approve", "Approve", "Disapprove", "Strongly disapprove")
table(hw21_select$TRUDP105R_recode) 
hw21_select$TRUDP105R_as_numeric <- as.numeric(hw21_select$TRUDP105R_recode)
table(hw21_select$TRUDP105R_as_numeric)

table(hw21_select$CNRNCMCV1)
hw21_select <- hw21_select %>%
  dplyr::mutate(CNRNCMCV1_recode = dplyr::recode(CNRNCMCV1, 'Vol: Unsure' = NA_character_))
table(hw21_select$CNRNCMCV1_recode) 
hw21_select$CNRNCMCV1_recode <- forcats::fct_relevel(hw21_select$CNRNCMCV1_recode, "Not concerned at all", "Not very concerned", "Concerned", "Very concerned")
table(hw21_select$CNRNCMCV1_recode) 
hw21_select$CNRNCMCV1_as_numeric <- as.numeric(hw21_select$CNRNCMCV1_recode)
table(hw21_select$CNRNCMCV1_as_numeric)


table(hw21_select$TRSTCV1A)
hw21_select <- hw21_select %>%
  dplyr::mutate(TRSTCV1A_recode = dplyr::recode(TRSTCV1A, 'Vol: Unsure' = NA_character_,'Vol: REFUSED' = NA_character_))
table(hw21_select$TRSTCV1A_recode) 
hw21_select$TRSTCV1A_recode <- forcats::fct_relevel(hw21_select$TRSTCV1A_recode, "A great deal", "A good amount", "Not very much", "Not at all")
table(hw21_select$TRSTCV1A_recode) 
hw21_select$TRSTCV1A_as_numeric <- as.numeric(hw21_select$TRSTCV1A_recode)
table(hw21_select$TRSTCV1A_as_numeric)

table(hw21_select$TRSTCV1B)
hw21_select <- hw21_select %>%
  dplyr::mutate(TRSTCV1B_recode = dplyr::recode(TRSTCV1B, 'Vol: Unsure' = NA_character_,'Vol: REFUSED' = NA_character_))
table(hw21_select$TRSTCV1B_recode) 
hw21_select$TRSTCV1B_recode <- forcats::fct_relevel(hw21_select$TRSTCV1B_recode, "A great deal", "A good amount", "Not very much", "Not at all")
table(hw21_select$TRSTCV1B_recode) 
hw21_select$TRSTCV1B_as_numeric <- as.numeric(hw21_select$TRSTCV1B_recode)
table(hw21_select$TRSTCV1B_as_numeric)

table(hw21_select$TRSTCV1D)
hw21_select <- hw21_select %>%
  dplyr::mutate(TRSTCV1D_recode = dplyr::recode(TRSTCV1D, 'Vol: Unsure' = NA_character_,'Vol: REFUSED' = NA_character_))
table(hw21_select$TRSTCV1D_recode) 
hw21_select$TRSTCV1D_recode <- forcats::fct_relevel(hw21_select$TRSTCV1D_recode, "A great deal", "A good amount", "Not very much", "Not at all")
table(hw21_select$TRSTCV1D_recode) 
hw21_select$TRSTCV1D_as_numeric <- as.numeric(hw21_select$TRSTCV1D_recode)
table(hw21_select$TRSTCV1D_as_numeric)

table(hw21_select$PARTYID)

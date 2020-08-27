## This script is the "parent" script for analysis and visualisations.
## Use `source()` to run the "child" scripts.

# Load packages -----------------------------------------------------------
library(tidyverse)
library(here)
library(readxl)


# Load data ---------------------------------------------------------------
source(here("script", "read in data.R"))

# Load font ---------------------------------------------------------------
showtext::showtext_auto()

# Analysis starts here ----------------------------------------------------
## Occupation
df_hkdc %>%
  filter(ConstituencyCode == "A-01") %>%
  select(Occupation)
  
## 2019 vote info
df_hkdc <- df_hkdc %>%
  mutate(VoteInfo = paste0(Vote, " (", VotePercentage, "%)"))

df_hkdc %>%
  filter(ConstituencyCode == "A-01") %>%
  select(VoteInfo)

## District breakdown based on camps
df_hkdc_seats <- df_hkdc %>%
  group_by(District_EN, Camp) %>%
  summarise(Seats = n()) %>%
  mutate(Camp = replace_na(Camp, "其他")) %>%
  mutate(Color = case_when(
    Camp == "泛民" ~ "#008B8B",
    Camp == "其他" ~ "#B8860B",
    Camp == "建制" ~ "#A52A2A"
  ))
  
df_hkdc_seats_2 <- df_hkdc %>%
  select(ConstituencyCode, Constituency_EN, Constituency_ZH, District_EN, District_ZH) %>%
  left_join(df_hkdc_seats, by = "District_EN")

df_hkdc_seats_2 %>%
  filter(ConstituencyCode == "Q-28") %>%
  ggplot(aes(x ="", y = Seats, fill = Camp)) +
  geom_bar(width = 1, stat = "identity") +
  ##coord_polar("y") +
  scale_fill_manual(values = df_hkdc_seats_2$Color) + ## Yellow didn't show for 其他
  theme_minimal()
  
  
  



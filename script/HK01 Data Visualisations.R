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
## Output 1 - Occupation
df_hkdc %>%
  filter(ConstituencyCode == "A-01") %>%
  select(Occupation)
  
## Output 2 - 2019 vote info
df_hkdc <- df_hkdc %>%
  mutate(VoteInfo = paste0(Vote, " (", VotePercentage, "%)"))

df_hkdc %>%
  filter(ConstituencyCode == "A-01") %>%
  select(VoteInfo)

## Output 3 - District breakdown based on camps
df_hkdc_seats <- df_hkdc %>%
  group_by(District_EN, Camp) %>%
  summarise(Seats = n()) %>%
  mutate(Camp = replace_na(Camp, "其他"))
  
df_for_bar_chart <- df_hkdc %>%
  select(ConstituencyCode, Constituency_EN, Constituency_ZH, District_EN, District_ZH) %>%
  left_join(df_hkdc_seats, by = "District_EN")

df_for_bar_chart %>%
  filter(ConstituencyCode == "C-02") %>%
  arrange(desc(Seats)) %>%
  rename(陣營 = Camp, 席數 = Seats) %>%
  ggplot(aes(x = "", y = 席數, fill = 陣營)) +
  geom_bar(stat = "identity", width = 1) +
  coord_flip() +
  scale_fill_manual(values = c("泛民" = "#008B8B", "其他" = "#B8860B", "建制" = "#A52A2A")) +
  theme_minimal() +
  theme(legend.title = element_blank(),
        legend.position = "top",
        legend.margin = margin(0, 0, 0, 0),
        legend.box.spacing = unit(0, "cm"),
        axis.title = element_blank(),
        axis.text = element_blank(),
        panel.grid = element_blank())

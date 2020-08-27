## This script is the "parent" script for analysis and visualisations.
## Use `source()` to run the "child" scripts.

# Load packages -----------------------------------------------------------
library(tidyverse)
library(here)
library(readxl)


# Load data ---------------------------------------------------------------
source(here("script", "read in data.R"))


# Analysis starts here ----------------------------------------------------
glimpse(df_hkdc)
summary(df_hkdc)

## Visual output
visdat::vis_dat(df_hkdc)
DataExplorer::create_report(df_hkdc)
inspectdf::show_plot(inspectdf::inspect_cat(df_hkdc))
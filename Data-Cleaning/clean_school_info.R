
# Cleaning the data files from the Data/School_Details folder
# Packages required: readr, tidyverse

library(tidyverse)


# Read in the datasets

Enrollment <- readr::read_csv("Data/School_Details/Enrollment.csv")
Expenditures <- readr::read_csv("Data/School_Details/Expenditures.csv")
Support <- readr::read_csv("Data/School_Details/Support.csv")

# Replace negative values with NA

Enrollment <- Enrollment %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -9))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -8))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -7))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -6))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -5))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -4))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -3))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -2))) %>%
  mutate(across(SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M, ~na_if(., -1)))

Expenditures <- Expenditures %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -9))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -8))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -7))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -6))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -5))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -4))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -3))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -2))) %>%
  mutate(across(SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED, ~na_if(., -1)))

Support <- Support %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -9))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -8))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -7))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -6))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -5))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -4))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -3))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -2))) %>%
  mutate(across(SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC, ~na_if(., -1)))


# Join Data

Enrollment <- Enrollment %>%
  select(COMBOKEY, SCH_PSENR_NONIDEA_A3:SCH_ENR_504_M)

Expenditures <- Expenditures %>%
  select(COMBOKEY, SCH_SAL_TOTPERS_WOFED:SCH_NPE_WFED)

Support <- Support %>%
  select(COMBOKEY, SCH_FTETEACH_TOT:SCH_FTESERVICES_SOC)

SchoolInfo <- Enrollment %>%
  inner_join(Expenditures, by = "COMBOKEY") %>%
  inner_join(Support, by = "COMBOKEY")




#readr::write_csv(SchoolInfo, "Data/School_Details/SchoolInfo_Combined.csv")

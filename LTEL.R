
# https://www.cde.ca.gov/ds/sd/sd/filesltel.asp



library(tidyverse)
library(here)
library(plotly)


LTEL <- read_tsv(here("data","LtelDownload18-19.txt"), col_types = "ffffcccffffnnnnnnnnnnnnn"  ) %>%
    mutate(perc.AR = AR/`Total-EE`,
           perc.LTEL = LTEL/`Total-EE`,
           perc.ARLTEL = (AR+LTEL)/`Total-EE`,
           perc.EL = EL/TotalEnrollment)


# LTEL %>% filter(Grade == "All")


LTEL.mry <- LTEL %>%
    filter(CountyCode == "27",
           Grade == "06",
           `Total-EE` >= 10,
           Gender == "ALL") 


p <- ggplot(LTEL.mry) +
    geom_point(aes(x = perc.EL, y = perc.ARLTEL, label = SchoolName)) 

ggplotly(p)

library(tidyverse)

read.csv("cancer_stats.csv") -> cancer
cancer

cancer%>%
  filter(Class=="Digestive System")%>%
  filter(`Male.Cases` < `Female.Cases`)

cancer%>%
  filter(is.na(`Male.Cases`))

cancer%>%
  filter(is.na(`Female.Cases`))

cancer%>%
  arrange((`Male.Deaths`/`Male.Cases`))

cancer%>%
  filter(str_detect(Site,"acute"))


c("Tongue", "Kidney", "Breast", "Pancrease") -> tissue_to_test
cancer%>%
  filter(tolower(Site) %in% tolower(tissue_to_test))%>%
  filter(Class=="soft tissue")

cancer%>%
  filter(str_sub(Site,-1,-1)=="y")

cancer%>%
  filter(nchar(Site)<4,str_sub(Site,-1,-1)=="y")


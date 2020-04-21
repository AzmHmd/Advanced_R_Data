library(tidyverse)

read.csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/tidy_data1.csv") -> tidy1
read.csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/tidy_data2.csv") -> tidy2
read.csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/tidy_data3.csv") -> tidy3

tidy1%>%
  pivot_longer(cols = DMSO, names_to = "samples",values_to = "values") %>%
  filter(!is.na(values))%>%
  arrange(samples)



tidy2%>%
  select(-(Chr:Strand))%>%
  pivot_longer(cols = A:E ,names_to = "samples",values_to = "vals")


tidy3%>%
  pivot_longer(cols = WT_1:KO_3 ,names_to = "temp",values_to = "count")%>%
  separate(col = temp, into = c('genotype','replicate'),sep = '_',convert = TRUE)

#=======================================================
read.csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/double.csv") -> tidy4
cancer%>%
  pivot_longer(cols = Male.Cases:Female.Deaths, names_to = "samples",values_to = "values") 
#=======================================================
cancer%>%
  pivot_longer(cols = Male.Cases:Female.Deaths, names_to = "samples",values_to = "values") -> pivot_long
pivot_long
#=======================================================
read.csv("genomes.csv")->genomes
genomes

genomes %>%
  separate(col=Groups,into = c("Domain", "Kingdom","Class"),sep=";") %>%
  filter(!str_detect(Organism,'\''))%>%
  filter(!str_detect(Kingdom,'Other') & !str_detect(Class,'Other'))
    
           

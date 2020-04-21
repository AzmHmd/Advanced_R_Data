library(tidyverse)
setwd("/home/azamhamidinekoo/Downloads/Advanced_R_Data")
read.csv("genomes.csv")->genomes
genomes
         
genomes %>%
  filter(Chromosomes>40)

genomes %>%
  filter(Plasmids>0)%>%
  filter(Chromosomes>1)

genomes  %>%
  arrange(desc(Size)) %>%
  slice(1:10)

genomes  %>%
  select(-Groups)

genomes  %>%
  select(starts_with("O"))

genomes  %>%
  distinct(Groups, .keep_all=TRUE)%>%
  nrow()

#scatterplot of the number of chromosomes vs the genome size

genomes  %>%
  arrange(Size) %>%
  distinct(Chromosomes, .keep_all=TRUE)%>%
  filter(Chromosomes !=0)%>%
  ggplot(aes(x=Chromosomes, y=Size)) + geom_point()

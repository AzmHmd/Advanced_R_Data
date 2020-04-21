library(tidyverse)
setwd("/home/azamhamidinekoo/Downloads/Advanced_R_Data")

read_tsv("small_file.txt",col_types = cols(Category=col_factor())) -> small
         
read_csv("Child_Variants.csv",guess_max = 10000000) -> child

child %>%
  ggplot(aes(x=CHR, y=COVERAGE))+geom_point()

library(tidyverse)

read_csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/cancer_stats.csv") -> cancer

cancer%>%
  mutate(cases=`Male Cases`+`Female Cases`,
         deaths=`Male Deaths`+`Female Deaths`)
#-----------------------------------------------------------------------------------------------------------
read_csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/Child_Variants.csv") -> child
head(child)
child%>%
  mutate(Type=if_else(nchar(REF)==1 & nchar(ALT)==1, 'SNP', 'INDEL'))-> child
view(child)
#-----------------------------------------------------------------------------------------------------------
read_tsv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/small_file.txt") -> small
head(small)
small%>%
  group_by(Category)%>%
  summarise(Average=mean(Length),STD=sd(Length))
#-----------------------------------------------------------------------------------------------------------
head(child)
child%>%
  filter(Type=='SNP')%>%
  filter(dbSNP == '.')%>%
  group_by(GENE)%>%
  summarise(COVERAGE = mean(COVERAGE),count = n())%>%
  filter(count>3)%>%
  arrange(desc(COVERAGE))%>%
  ungroup()%>%
  view()
#-----------------------------------------------------------------------------------------------------------
read_csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/tidy_data2.csv") -> tidy2
tidy2%>%
  pivot_longer(cols=A:E,names_to = "category",values_to = "value")%>%
  group_by(Chr,category)%>%
  summarise(valueMean = mean(value))%>%
  ungroup()
#-----------------------------------------------------------------------------------------------------------
cancer%>%
  mutate(diffIncidence = `Male Cases`-`Female Cases`)%>%
  mutate(diffIncidenceABS = abs(diffIncidence))%>%
  arrange(diffIncidenceABS)%>%
  slice(1)%>%
  select(Class)
  
  
  
  
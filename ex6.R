library(tidyverse)

read_csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/dna_methylation.csv") -> dna1

dna1 %>%
  pivot_wider(names_from = "State",values_from = "Count")%>%
  mutate(percentage=Meth/(Meth+Unmeth)*100) -> dna2

dna2 %>%
  group_by(Gene,Group)%>%
  summarise(meanMeth = mean(percentage)) -> dna3

read_tsv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/methylation_annotation.txt") -> annotation
annotation
dna3%>%
  rename(Gene_name = Gene)%>%
  right_join(annotation) 
#-------------------------------------------------------------------------
read_csv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/Child_Variants.csv") -> child
child%>%
  mutate(Type=if_else(nchar(REF)==1 & nchar(ALT)==1, 'SNP', 'INDEL'))-> child

child%>%
  filter(Type == "SNP")%>%
  mutate(Mutation = str_c(REF,ALT,sep=("_")))%>%
  group_by(Mutation)%>%
  count()%>%
  ungroup()%>%
  arrange(desc(n))
#------------------------------------------------
read_tsv("/home/azamhamidinekoo/Documents/tutorials/Advanced_R_Data/small_file.txt")-> small
small%>%
  group_by(Category)%>%
  summarise(min_length=min(Length))%>%
  right_join(small)%>%
  mutate(normalized_length=Length-min_length)%>%
  ggplot(aes(x=Category, y=normalized_length))+geom_point()

         
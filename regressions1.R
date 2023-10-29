#this file belong to the 'r_code' folder in the folder reddit internship folder

#reference link - youtube video
#https://www.youtube.com/watch?v=bQZGDKrbHoA

#set path
print(getwd())
setwd("/Users/sarayuvyakaranam/Desktop/reddit_code_internship/r_code")
print(getwd())

#install packages
#install.packages('fixest')
#install.packages(c('tibble', 'dplyr', 'readr'))
install.packages('datawizard')

#import some libraries
library(haven) 
library(readxl)
library(fixest)
library(dplyr)
library(stargazer)

#load the dataset
data <- read.csv("data_result_fifteen_subreddits_aggressive_language.csv")
View(data)
summary(data)

#rename the columns according to speaker-receiver nomenclature
data1 <- data %>% 
  rename("speaker" = "author" ,
         "networkSimilarity" = "network_similarity",
         "languageSimilarity" = "cultural_similarity" ,
         "insultScore" = "insult_prob" ,
         "threatScore" = "threat_prob" ,
         "toxicityScore" = "toxicity_prob",
         "languageSimilarity_Dummy" = "cultural_similarity_Dummy",
         "receiver" = "parent_comment_author")
View(data1)

#------------------------------without using any fixed effects and clustered standard errors-----------------------------
#----using the 'y' variable 'threat'----
reg_threat_eq1 <- feols(threatScore ~ networkSimilarity, data = data1)
etable(reg_threat_eq1)
reg_threat_eq2 <- feols(threatScore ~ languageSimilarity, data = data1)
etable(reg_threat_eq2)
reg_threat_eq3 <- feols(threatScore ~ networkSimilarity + languageSimilarity, data = data1)
etable(reg_threat_eq3)
reg_threat_eq4 <- feols(threatScore ~ networkSimilarity*languageSimilarity, data = data1)
etable(reg_threat_eq4)
etable(reg_threat_eq1,reg_threat_eq2,reg_threat_eq3,reg_threat_eq4)
etable(list(reg_threat_eq1, reg_threat_eq2, reg_threat_eq3, reg_threat_eq4), tex=TRUE, file ='threat_regressions_without_FE_CSE.txt')

#----using the 'y' variable 'insult'----
reg_insult_eq1 <- feols(insultScore ~ networkSimilarity, data = data1)
etable(reg_insult_eq1)
reg_insult_eq2 <- feols(insultScore ~ languageSimilarity, data = data1)
etable(reg_insult_eq2)
reg_insult_eq3 <- feols(insultScore ~ networkSimilarity + languageSimilarity, data = data1)
etable(reg_insult_eq3)
reg_insult_eq4 <- feols(insultScore ~ networkSimilarity*languageSimilarity, data = data1)
etable(reg_insult_eq4)
etable(list(reg_insult_eq1, reg_insult_eq2, reg_insult_eq3, reg_insult_eq4), tex=TRUE, file ='insult_regressions_without_FE_CSE.txt')

#----using the 'y' variable 'toxicity'----
reg_toxicity_eq1 <- feols(toxicityScore ~ networkSimilarity, data = data1)
etable(reg_toxicity_eq1)
reg_toxicity_eq2 <- feols(toxicityScore ~ languageSimilarity, data = data1)
etable(reg_toxicity_eq2)
reg_toxicity_eq3 <- feols(toxicityScore ~ networkSimilarity + languageSimilarity, data = data1)
etable(reg_toxicity_eq3)
reg_toxicity_eq4 <- feols(toxicityScore ~ networkSimilarity*languageSimilarity, data = data1)
etable(reg_toxicity_eq4)
etable(list(reg_toxicity_eq1, reg_toxicity_eq2, reg_toxicity_eq3, reg_toxicity_eq4), tex=TRUE, file ='toxicity_regressions_without_FE_CSE.txt')


#------------------------------with fixed effects and with clustered standard errors------------------
#----using the 'y' variable 'threat'----
reg_threat_eq1 <- feols(threatScore ~ networkSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_threat_eq1)
reg_threat_eq2 <- feols(threatScore ~ languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_threat_eq2)
reg_threat_eq3 <- feols(threatScore ~ networkSimilarity + languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_threat_eq3)
reg_threat_eq4 <- feols(threatScore ~ networkSimilarity*languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_threat_eq4)
etable(list(reg_threat_eq1, reg_threat_eq2, reg_threat_eq3, reg_threat_eq4), tex=TRUE, file ='threat_regressions.txt')

#----using the 'y' variable 'insult'----
reg_insult_eq1 <- feols(insultScore ~ networkSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_insult_eq1)
reg_insult_eq2 <- feols(insultScore ~ languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_insult_eq2)
reg_insult_eq3 <- feols(insultScore ~ networkSimilarity + languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_insult_eq3)
reg_insult_eq4 <- feols(insultScore ~ networkSimilarity*languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_insult_eq4)
etable(list(reg_insult_eq1, reg_insult_eq2, reg_insult_eq3, reg_insult_eq4), tex=TRUE, file ='insult_regressions.txt')

#----using the 'y' variable 'toxicity'----
reg_toxicity_eq1 <- feols(toxicityScore ~ networkSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_toxicity_eq1)
reg_toxicity_eq2 <- feols(toxicityScore ~ languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_toxicity_eq2)
reg_toxicity_eq3 <- feols(toxicityScore ~ networkSimilarity + languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_toxicity_eq3)
reg_toxicity_eq4 <- feols(toxicityScore ~ networkSimilarity*languageSimilarity | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_toxicity_eq4)
etable(list(reg_toxicity_eq1, reg_toxicity_eq2, reg_toxicity_eq3, reg_toxicity_eq4), tex=TRUE, file ='toxicity_regressions.txt')


#-----------------------Adding a cultural Similarity Dummy Variable---------------------------------
#found the median of cultural similairty to be 0.36710138618946075

data1 <- data1 %>% 
  mutate(languageSimilarity_Dummy = if_else(languageSimilarity >= 0.36710138618946075, 1, 0))
View(data1)


#run the same regressions again
#------------------------------without using any fixed effects and without clustered standard errors-----------------------------
#----using the 'y' variable 'threat'----
reg_threat_eq41 <- feols(threatScore ~ networkSimilarity*languageSimilarity_Dummy, data = data1)
etable(reg_threat_eq41)

#----using the 'y' variable 'insult'----
reg_insult_eq42 <- feols(insultScore ~ networkSimilarity*languageSimilarity_Dummy, data = data1)
etable(reg_insult_eq42)

#----using the 'y' variable 'toxicity'----
reg_toxicity_eq43 <- feols(toxicityScore ~ networkSimilarity*languageSimilarity_Dummy, data = data1)
etable(reg_toxicity_eq43)

#------------------------------with fixed effects and with clustered standard errors-----------------------------
#----using the 'y' variable 'threat'----
reg_threat_eq41b <- feols(threatScore ~ networkSimilarity*languageSimilarity_Dummy | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_threat_eq41b)

#----using the 'y' variable 'insult'----
reg_insult_eq42b <- feols(insultScore ~ networkSimilarity*languageSimilarity_Dummy | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_insult_eq42b)

#----using the 'y' variable 'toxicity'----
reg_toxicity_eq43b <- feols(toxicityScore ~ networkSimilarity*languageSimilarity_Dummy | speaker, data = data1, cluster = c('speaker','receiver'))
etable(reg_toxicity_eq43b)

etable(list(reg_threat_eq41, reg_insult_eq42, reg_threat_eq41b, reg_insult_eq42b), tex=TRUE, file ='cultSim_Dummy.txt')






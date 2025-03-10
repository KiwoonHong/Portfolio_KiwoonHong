#######################
#####assignment4#######
###2016312703 홍기운###
#######################


#############data pre-processing#####################


library(dplyr)

setwd("C:/Users/kiwoo/Desktop/R/assignmnet4")
demo2016 <- read.csv("klosa_2016_demo.csv", header=T)
demo2016
con2016 <- read.csv("klosa_2016_consumption.csv", header=T)
con2016

merged <- left_join(demo2016, con2016, by="pid")

merged[merged==""] <- NA

merged <- merged %>% 
  rowwise() %>% 
  mutate(totcon = sum(c(w06e201,w06e207,w06e213,w06e219,w06e225,w06e231,w06e237,w06e243,w06e249,w06e255,w06e261,w06e267,w06e273), na.rm = TRUE))

merged <- rename(merged, 
                 age = w06a002_age,
                 gender = w06gender1,
                 education = w06edu,
                 marriage = w06marital,
                 employment = w06job,
                 income = w06e147,
                 homeown = w06f001,
                 region = w06region1,
                 
                 miscellaneous = w06e201,
                 foodathome = w06e207,
                 foodout = w06e213,
                 publicedu = w06e219,
                 privateedu = w06e225,
                 housing = w06e231,
                 medical = w06e237, 
                 clothing = w06e243, 
                 insurance = w06e249, 
                 vehicle = w06e255, 
                 communication = w06e261, 
                 rectravel = w06e267, 
                 gift = w06e273)

merged <- merged %>% 
  rowwise() %>% 
  mutate(food = sum(c(foodathome,foodout), na.rm = TRUE))
merged <- merged %>% 
  rowwise() %>% 
  mutate(hhousing = sum(c(housing), na.rm = TRUE))
merged <- merged %>% 
  rowwise() %>% 
  mutate(cclothing = sum(c(clothing), na.rm = TRUE))
merged <- merged %>% 
  rowwise() %>% 
  mutate(edu = sum(c(publicedu,privateedu), na.rm = TRUE))
merged <- merged %>% 
  rowwise() %>% 
  mutate(health = sum(c(insurance,medical), na.rm = TRUE))
merged <- merged %>% 
  rowwise() %>% 
  mutate(etc = sum(c(rectravel,gift,vehicle, communication,miscellaneous), na.rm = TRUE))


merged <- merged %>% filter(age>=60 & age<=90)


merged$education <- ifelse(merged$education>=3, 2, 1)#1저학력2고학력
merged$marriage <- ifelse(merged$marriage==1, 1, 2)#1기혼2미혼
merged$employment <- ifelse(merged$employment==3, 2, 1)#1취업2비취업
merged$homeown <- ifelse(merged$homeown==1, 1, 2)#1자가2전월세
merged$region <- ifelse(merged$region==c(11,31), 1, 2)#1수도권2비수도권


library(ggplot2)
library(psych)
summary(merged)
describe(merged)
qplot(merged$income)
qplot(merged$totcon)
qplot(merged$food)
qplot(merged$edu)
qplot(merged$health)


###################data analysis 1######################

desc_gender_employment <- merged %>% 
  group_by(gender) %>% 
  summarize(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
desc_gender_employment

desc_gender_employment <- merged %>% 
  group_by(gender, employment) %>% 
  summarize(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
desc_gender_employment

desc_marriage_employment <- merged %>% 
  group_by(marriage, employment) %>% 
  summarize(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
desc_marriage_employment

desc_gender_education_employment <- merged %>% 
  group_by(gender, education, employment) %>% 
  summarize(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(percent=round(n/tot_group*100,1))
desc_gender_education_employment

desc_marriage <- merged %>% 
  group_by(marriage,employment) %>% 
  summarize(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
desc_marriage

strsct <-ggplot(merged, aes(x=income, y=totcon))
strsct <- strsct + geom_point()
strsct <- strsct + facet_wrap(~ marriage)
print(strsct)

############data anlysis 2###############
cons_gender <- merged %>% 
  group_by(gender) %>% 
  summarize(mean_food=mean(food),
            mean_clothing=mean(cclothing),
            mean_health=mean(health),
            mean_housing=mean(hhousing),
            mean_totcon=mean(totcon))
cons_gender

cons_employment <- merged %>% 
  group_by(employment) %>% 
  summarize(mean_food=mean(food),
            mean_clothing=mean(cclothing),
            mean_health=mean(health),
            mean_housing=mean(hhousing),
            mean_totcon=mean(totcon))
cons_employment

cons_region <- merged %>% 
  group_by(region) %>% 
  summarize(mean_food=mean(food),
            mean_clothing=mean(cclothing),
            mean_health=mean(health),
            mean_housing=mean(hhousing),
            mean_totcon=mean(totcon))
cons_region


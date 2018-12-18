# 01 안녕 R
# 01-1 R이해하기
# R : 데이터 분석하는데 사용되는 소프트웨어
# (1) 다양한 범용 분석툴 : 통계분석, 머신러닝모델링, 텍스트마이닝, 소셜네트워크분석,
#                          지도시각화, 주식분석, 이미지분석, 사운드분석, 웹어프리케이션개발
# 캐글 : 온라인 데이터 분석 대회
# 01-2 R이 강력한 이유
# 데이터분석도구 : 프로그래밍방식(cf:GUI-엑셀, SPSS)==> 재현성확보, 오류줄어듬, 공동작업가능
# R : 데이터분석용 -> 데이터처리, 통계분석에 특화 / 파이썬 : 데이터 분석 기능ex:tenserflow
# 02 R데이터분석 환경 02-1 설치
# 02-2 소스창(명령어 기록)/콘솔창(명령어실행)/환경창(생성데이터보여줌)/히스토리창(실행영령어)
#       /파일창(폴더에 있는 파일 보여줌)
# 02-3 프로젝트 만들기
# 02-3 프로젝트 > 스크립트, 데이터생성-스크립트 수정 : 저장여부?
# 02-4 tool -> Global Options -> code -> Soft-wrap R source files 
#      tool -> Project Options -> code -> Text encoding -> UTF-8
#ch3 변수 만들기 P200초보실수 참고 ** 변수는 반드시 문자로 시작
setwd("C:/Users/michelle/Documents/ewha18-2/practicum")
getwd()
a<- 1
a
b<-2
b
c <-3 
c
d - 3.5
d
a+b
a+b+c
4/b
5*b
var1 <- c(1,2,5,7,8)
var1
var2 <- c(1:5)
var2
var3 <- seq(1,5)
var3
var4 <- seq(1, 10, by=2)
var4
var5 <- seq(1, 10, by=3)
var5
var1
var1+2
var1 + var2
str1 <- "a"
str1
str2 <- "text"
str2
str3 <- "Hello World"
str3
str4 <- c("a", "b", "c")
str4
str5 <- c("Hello", "World", "is", "good!")
str5
str1 + 5
#03-2 함수
# 변수 만들기 - paste(변수합치기), collapse(옵션설정하는 매개변수)
x <- c(1,2,3)
x
mean(x)
max(x)
min(x)
str5
paste(str5, collapse = ",")
paste(str5, collapse = " ")
x_mean <- mean(x)
x_mean
str5_paste <- paste(str5, collapse = " ")
str5_paste
#03-3 패키지(패키지설치->로드->함수사용)-로드는 r시작할때마다 반복
install.packages("ggplot2") # 괄호안에 반드시 " "표
library(ggplot2) #큰 따옴표 필요없음
x <- c("a", "a", "b", "c")
x
qplot(x)
qplot(data = mpg, x=hwy)
qplot(data = mpg, x= cty)
qplot(data = mpg, x=drv, y=hwy)
qplot(data = mpg, x=drv, y= hwy, geom="line")
qplot(data = mpg, x=drv, y= hwy, geom="boxplot")
qplot(data = mpg, x=drv, y= hwy, geom="boxplot", colour = drv)

exam <- c(80,60, 70, 50, 90)
exam
mean(exam)
mean_exam <- mean(exam)
mean_exam
#04장 - 데이터 프레임 : 열은 속성, 행은 한사람의 정보 => 열의 증가가 중요
english <- c(90,80,60, 70)
english
math <- c(50, 60, 100, 20)
math
df_midterm <- data.frame(english, math) # 데이터 프레임형식 
df_midterm
class <- c(1,1,2,2)
class
df_midterm <- data.frame(engligh, math, class)
df_midterm
mean(df_midterm$engligh)
mean(df_midterm$math) #데이터 프레임 안에 리스트 있을 때 $표시시
df_midterm <- data.frame(engligh=c(90,80,60,70),
                         math= c(50, 60, 100, 20),
                         class= c(1,1,2,2))
df_midterm
#p88 혼자해보기
#Q1. fruit에 ""빼놓아 틀림"
df_fruit <- data.frame(fruit = c("apple", "strawberry", "watermelon"),
                       price = c(1800, 1500, 3000),
                       volum = c(24,38, 13))
df_fruit

#Q2
mean(df_fruit$price)
mean(df_fruit$volum)
# 04-3 외부데이터 이용 - 엑셀읽기 패키지 redxl - read_excel()확장자까지, 양쪽 따옴표
# 첫 라인을 변수로 읽지 않기위해  col_names=F 지정(엑셀에서), F는 반드시 대문자
install.packages("readxl")
library(readxl)
df_exam <- read_excel("excel_exam.xlsx")
df_exam
mean(df_exam$english)
mean(df_exam$science)
df_exam_novar <- read.excel("excel_exam_novar.xlsx")
df_exam
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names=F)
df_exam
# 이유모를 에러
df_exam_sheet <- read.excel("excel_exam_sheet.xlsx", sheet=1)
# df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names =F) 엑셀파일  
# df_csv_exam <- read.csv("csv_exam.csv", header = F) csv파일 
# df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F) 문자있는 파일 부를때
# P95 데이터프레임을 CSV파일로 저장 => wrete 함ㅅ
df_midterm <- data.frame(engligh=c(90,80,60,70),
                         math = c(50, 60, 100, 20),
                         class = c(1,1,2,2))
df_midterm
write.csv(df_midterm, file="df_midterm.csv")
# P96  RData vs csv RData=>load() csv=> write, Rda =>save, load
save(df_midterm, file = "df_midterm.rda")
rm(df_midterm)
df_midterm
load("df_midterm.rda")
df_midterm
# df_exam <- read_excel("excel_exam.xlsx")
# df_exam <- read.csv("csv_exam.csv")
# load("df_midterm.rda")
# 4장 정리-외부데이터 이용하기
#엑셀파일
library(readxl)   #readxl 패키지 로드
df_exam <- read_excel("excel_exam.xlsx") # 엑셀파일 불러오기
#csv파일
df_csv_exam <- read.csv("C:\\Users\\michelle\\Documents\\ewha18-2\\study\\csv_exam.csv") # csv파일 불러오기
write.csv(df_midterm, file= "C:\\Users\\michelle\\Documents\\ewha18-2\\study\\df_dmidterm.csv") #csv 파일로 저장하기
#Rda파일
load("df_midterm.rda") #Rda파일 불러오기
save(df_midterm, file= "df_midterm.rda") # Rda파일로 저장하기

# 5장 데이터 분석 기초
exam <- read.csv("csv_exam.csv")
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam)
str(exam)
summary(exam)

# P106 mpg데이터 파악
detach("package:ggplot2", unload=TRUE) # 패키지실행 안될때 로딩안되게 하는
remove.packages("ggplot2")
install.packages("ggplot2")

#ggplot2가 설치 안될때 
#install.packages("dplyr", repos = "https://cran.rstudio.com", dependencies = TRUE)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg) 
summary(mpg)

#rename
df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new <- df_raw
df_new
df_new <- rename(df_new, v2=var2)
df_new
df_new <- rename(df_new, v1=var1)
df_new
df_raw
# P112혼자서해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new
mpg_new <- rename(mpg_new, city=cty, highway=hwy)
mpg_new
head(mpg_new)
# p113 05-3 파생변수 만들기: 기존변수 변형해 만든 변수
df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df
var_sum <- df$var1 + df$var2
var_sum
df$var_sum <- df$var1 + df$var2
df$var_sum
df
df$var_mean <- (df$var1 + df$var2)/2
df
# 통합연비변수 만들기
mpg$total <- (mpg$cty + mpg$hwy)/2
mpg$total
head(mpg$total)
head(mpg)
mean(mpg$total)

install.packages("dplyr")
exam <- read.csv("C:\\Users\\michelle\\Documents\\ewha18-2\\study\\csv_exam.csv")
exam
head(exam)

#127 exam에서 class가 1인 경우만 추출해 출력
library(dplyr)
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class == 3)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 80)
exam %>% filter(math < 50)
exam %>% filter(english >=80)
exam %>% filter(english <=80)
exam %>% filter(class == 1 & math < 50)

exam %>% filter(class == 1 & math > 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <= 90 | science <=50)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))#1,3,5반에 해당하면 추출
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)
mean(class2$math)

# p 133 혼자서 해보기
#Q1
library(dplyr)
mpg <- as.data.frame(ggplot2 ::mpg)
mpg_a <- mpg %>% filter(displ <= 4)
mpg_b <- mpg %>% filter(displ >=5)
mean(mpg_a$hwy)
mean(mpg_b$hwy)

#Q2
mpg_audi <- mpg %>% filter(manufacturer == "audi")
mpg_toyota <- mpg %>% filter(manufacturer == "toyota")
mean(mpg_audi$cty)  
mean(mpg_toyota$cty)
#3
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet","ford", "honda"))
mean(mpg_new$hwy)                             
#06-3    열제거 select (제외 -)                         
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)
exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>% 
  select(english)
exam %>% 
  select(id, math) %>% 
  head
exam %>% 
  select(id, math) %>% 
  head(10)
#p138
#Q1
mpg <- as.data.frame(ggplot2 ::mpg)
df <- mpg %>% select(class, cty)
head(df)
#Q2
df_suv <- df %>% filter(class == "suv")
df_compact <- df %>% filter(class == "compact")
mean(df_suv$cty)
mean(df_compact$cty)
#P139 06-4순서대로 정렬
exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class,math)
#p141 혼자서 
mpg <- as.data.frame(ggplot2 ::mpg)
mpg %>% filter(manufacturer == "audi") %>% 
        arrange(desc(hwy)) %>% 
                  head(5)
# p142 06-5파생변수 추가하기
exam %>% 
  mutate(total = math +english + science) %>% 
  head
exam %>% 
  mutate(mean = (math +english +science)/3) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = (math +english +science)/3) %>% 
  head
exam %>% mutate(test = ifelse(science >=60, "pass", "fail")) %>% 
  head
exam %>% mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head
# p144 혼자서 해보기
#Q1
library(dplyr)
mpg <- as.data.frame(ggplot2:: mpg)
mpg_new <- mpg         
mpg_new <- mpg_new %>% mutate(total = cty +hwy) %>% 
  head()
#Q 2
mpg_new %>% mutate(mean = total/2) %>% 
  head
#Q 3 
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)

#Q 4
mpg %>% 
  mutate(total=cty + hwy, 
         Mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
#06-6 집단별로 요약하기 summarise, group_by
head(exam)
exam %>% summarise(mean_math = mean(math))
exam
exam %>% 
  group_by(class) %>% 
  summarise(mean_math =mean(math))
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
             sum_math = sum(math),
             median_math = median(math),
             n=n())

mpg %>% 
  group_by(manufacturer, drv) %>% #회사별, 구동방식별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 산출
  head(10)

# dplyr 조합
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty +hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)
#p150 혼자서 해보기
#Q1 
mpg <- as.data.frame(ggplot2 :: mpg)
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = (mean(cty)))
#Q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

#Q3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
#Q4
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count=n()) %>%
  arrange(desc(count))
#p151 06-7 데이터 합치기
# 중간고사 데이터 생성  
test1 <- data.frame(id=c(1,2,3,4,5),
                    midterm = c(60,80, 70, 90, 85))
test1
# 기말고사 데이터 생성 
test2 <- data.frame(id=c(1,2,3,4,5),
                    final=c(70, 83, 65, 95, 80))
test2
total <- left_join(test1, test2, by = "id")
total
# 다른 데이터 활용해 변수 추가하기
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi","jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new
#p154 세로로 합치기
group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,70,80,90, 85))
group_a
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_b
group_all <- bind_rows(group_a, group_b)
group_all

# p156 
mpg <- as.data.frame(ggplot2 :: mpg)
fuel <- data.frame(fl=c(c,d,e,p,r),
                   price_fl=c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
#Error in data.frame(fl = c(c, d, e, p, r), price_fl = c(2.35, 2.38, 2.11,  : 
# object 'd' not found 
fuel
#p160분석도전
# 문제1
midwest <- as.data.frame(ggplot2::midwest)
midwest <- midwest %>% 
  mutate(ratio_child=(poptotal-popadults)/poptotal*100) %>% 
  head(3)
midwest
#문제2
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)
#문제3
midwest <- midwest %>% 
  mutate(grade=ifelse(ratio_child >= 40, "large",
         ifelse(ratio_child >= 30, "middle", "small")))
midwest
table(midwest$grade)

# 문제4
midwest %>% 
  mutate(ratio_asian = (popasian/poptotal)*100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)

# p162 07-1 결측치 정제
df <- data.frame(sex = c("M","F",NA, "M", "F"),
                 score=c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)
sum(df$score)
library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))#score가 결측치가 아닌행만 추출
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss
df_nomiss2 <- na.omit(df)
df_nomiss2
mean(df$score, na.rm=T)
sum(df$score, na.rm=T)
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15),"math"] <- NA #3,8, 15 행의 math에 NA할당
exam
exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math, na.rm=T))
exam %>% summarise(mean_math=mean(math, na.rm=T),
                   sum_math=sum(math, na.rm=T),
                   median_math=median(math,na.rm=T))
mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math) #math NA면 55로 대체
table(is.na(exam$math)) #결측치 빈도표 생성 
exam
mean(exam$math)
#p170혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
#Q1 
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
#Q2
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy =mean(hwy))
#p171 07-2 이상치 정제하기
outlier <- data.frame(sex=c(1,2,1,3,2,1), 
                      score=c(5,4,3,4,2,6))
outlier
table(outlier$sex)
table(outlier$score)
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$sex
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
#12-37벗어나면 NA할당
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy > 37, NA, mpg$hwy)
mpg$hwy
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm =T))
#p178 
mpg <- as.data.frame(ggplot2 :: mpg)
mpg[c(10,14,58,93), "drv"] <- "k" # 이상치 할당
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42) #이상치 할당
#Q1
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv, NA)
table(mpg$drv)
#Q2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty >26, NA, mpg$cty)
mpg$cty
table(mpg$cty)
boxplot(mpg$cty)
#Q3 ?
mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% #결측치 제외 
  group_by(drv) %>%  # drv별 분리  
    summarise(mean_hwy = mean(cty))
#p181 08그래프
#08-2 산점도 
library(ggplot2)
ggplot(data=mpg, aes(x=displ, y=hwy))
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6)
ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point() + 
  xlim(3,6) +
  ylim(10, 30)
# P188 mpg vs midwest
#Q1
ggplot(data=mpg, aes(x=cty, y=hwy)) +
         geom_point()
#Q2
options(scipen = 0) #0은 지수, 99는 정ㅅ
ggplot(data=midwest, aes(x=poptotal, y=popasian)) +
         geom_point() +
         xlim(0, 500000) +
         ylim(0, 10000) 


#08-3 막대그래프-집단간 차이
library(dplyr)
df_mpg <- mpg %>% 
  filter(!is.na(drv)) %>% #결측치 k가 24가 나와서 함수 사용하여 없앰
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg
ggplot(data=df_mpg, aes(x=drv, y=mean_hwy)) +
  geom_col()
ggplot(data=df_mpg, aes(x= reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col() #이해 안됨
ggplot(data=mpg, aes(x=drv)) + geom_bar()
ggplot(data=mpg, aes(x=hwy)) + geom_bar()
#193 Q1
mpg <- as.data.frame(ggplot2 :: mpg)
#평균표 생성
df <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
df
#Q2 그래프 생성
ggplot(data=df, aes(x=reorder(manufacturer, -mean_cty),
                    y=mean_cty)) +
                geom_col()
ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()
#p195 Q1
ggplot(data=economics, aes(x=date, y=psavert)) +geom_line()
#08-5 상자그림
ggplot(data=mpg, aes(x=drv, y=hwy)) +
  geom_boxplot()
#P198
mpg <- as.data.frame(ggplot2 :: mpg)
class_mpg <- mpg %>% 
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data= class_mpg, aes(x=class, y=cty)) + geom_boxplot()

#15-1 R내장함수로 데이터 추출하기 
exam <- read.csv("csv_exam.csv")
exam
exam[]
exam[1,]
exam[2,]
Hong <-list(kor.name="홍길동",
            eng.name="gildong",
            age = "43",
            no.child = "2",
            child_ages = c(13, 10))
Hong$child.ages[2]
Hong["child.ages"][2]
Hong["child.ages"]

#p9장 09-1 한국복지패널데이터 분석 준비  
detach("package:foreign", unload=TRUE)
remove.packages("foreign") 
install.packages("foreign")
install.packages("dplyr")
library(foreign)
library(dply)
library(ggplot2)
library(readxl)
#데이터 불러오기
raw_welfare <- read.spss(file= "Koweps_hpc10_2015_betal.sav",
                        to.data.frame = T)
#복사본 만들기  
welfare <- raw_welfare
summary(welfare$birth)

#p225 09-4 
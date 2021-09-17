# (3-1) 이산형화(descretization)

library(MASS)
str(Cars93)

## 고속도로연비(MPG.highway) 히스토그램
hist(Cars93$MPG.highway)

## Model, MPG.highway 두 개 변수만 선택해서 disc_1 데이터 프레임 생성
disc_1 <- Cars93[,c("Model","MPG.highway")]

## 상위 6개 미리보기
head(disc_1)

## 6개 범주로 등간격 범주화
disc_1 <- within(disc_1,{
  MPG.highway_cd = character(0)
  MPG.highway_cd[MPG.highway >= 20 & MPG.highway <25 ] = "20~25"
  MPG.highway_cd[MPG.highway >= 25 & MPG.highway <30 ] = "25~30"
  MPG.highway_cd[MPG.highway >= 30 & MPG.highway <35 ] = "30~35"
  MPG.highway_cd[MPG.highway >= 35 & MPG.highway <40 ] = "35~40"
  MPG.highway_cd[MPG.highway >= 40 & MPG.highway <45 ] = "40~45"
  MPG.highway_cd[MPG.highway >= 45 & MPG.highway <= 50 ] = "45~50"
  MPG.highway_cd = factor(MPG.highway_cd,
                          levels = c("20~25", "25~30", "30~35",
                                     "35~40", "40~45", "45~50"))
})

## 상위 6개 보기
head(disc_1)
attributes(disc_1$MPG.highway_cd)

table(disc_1$MPG.highway_cd) # 분할표 생성

summary(disc_1$MPG.highway)

# 4분위수의 1Q, 2Q, 3Q, 4Q를 기준으로 4개의 범주 생성
disc_1 <- within(disc_1,{
  MPG.highway_cd2 = character(0)
  
})
# (1) 결측값이 포함되어 있는지 확인하는 방법: is.na()
x <- c(1,2,3,4,NA,6,7,8,9,NA)
is.na(x)

library(MASS)
is.na(Cars93)

# (2) 결측값이 총 몇 개인지 계산하는 방법: sum(is.na())
sum(is.na(x))

str(Cars93)

# Cars93 데이터 프레임에 결측값 갯수 총 합계 구하기
sum(is.na(Cars93))

# Cars93의 각 변수별로 결측값 개수 구하기 (27개 중에서 4개만 예시로 함)
sum(is.na(Cars93$Manufacturer))
sum(is.na(Cars93$Price))
sum(is.na(Cars93$Rear.seat.room))
sum(is.na(Cars93$Luggage.room))

colSums(is.na(Cars93))

# (3) 결측값을 통계 분석 시 제외(미포함): na.rm = TRUE
sum(x)
mean(x)
sum(x,na.rm = TRUE)
mean(x,na.rm = TRUE)

sum(Cars93$Luggage.room)
mean(Cars93$Luggage.room)
sum(Cars93$Luggage.room, na.rm = TRUE)
mean(Cars93$Luggage.room, na.rm = TRUE)

# (4) 결측값이 들어있는 행 전체를 데이터 셋에서 제거 : na.omit()
Cars93_1 <- na.omit(Cars93)
str(Cars93_1)

# (5) 특정 행과 열에 결측값이 들어있는 행을 데이터 셋에서 제거 : complete.cases()
sum(is.na(Cars93))

# Cars93 데이터 프레임의 "Rear.seat.room" 칼럼 내 결측값이 있는 행 전체 삭제
Cars93_2 <- Cars93[complete.cases(Cars93[,c("Rear.seat.room")]),]

# Cars93 데이터 프레임의 23~24번째 칼럼 내 결측값이 잇는 행 전체 삭제
Cars93_3 <- Cars93[complete.cases(Cars93[,23:24]),]
sum(is.na(Cars93_3))

dim(Cars93)
dim(Cars93_3)

# (6) 결측값을 다른 값으로 대체: dataset$var[is.na(dataset$var)] <- new_value
Cars93$Luggage.room
sum(is.na(Cars93$Luggage.room))

# Luggage.room 변수 내 결측값을 '0'으로 대체
Cars93_4 <- Cars93
Cars93_4$Luggage.room[is.na(Cars93_4$Luggage.room)] <- 0
Cars93_4$Luggage.room

# 결측값을 미포함했을때의 평균값으로 결측값을 대체
Cars93_5 <- Cars93
Cars93_5$Luggage.room[is.na(Cars93_5$Luggage.room)] <- mean(Cars93_5$Luggage.room, na.rm = TRUE)
sum(is.na(Cars93_5$Luggage.room))
Cars93_5$Luggage.room

# (7) 데이터프레임의 모든 행의 결측값을 특정 값(가령 '0')으로 일괄 대체
Cars93_6 <- Cars93
# counting the number of missing values in Cars93 dataset
sum(is.na(Cars93_6)) # 13
# converting the missing value in Cars93 dataframe to '0'
Cars93_6[is.na(Cars93_6)] <- 0
# counting the number of missing values in Cars93 dataset
sum(is.na(Cars93_6)) #0

# (8) 데이터프레임의 각 변수의 결측값을 각 변수 별 평귱값으로 일괄 대체
# converting the missing value in Cars93 dataframe to each column's mean value
Cars93_7 <- Cars93[1:20,c("Rear.seat.room","Luggage.room")]

colSums(is.na(Cars93_7))
Cars93_7

sapply(Cars93_7,function(x) mean(x,na.rm = TRUE))
Cars93_7 <- data.frame(sapply(Cars93_7,
                              function(x) ifelse(is.na(x),
                                                 mean(x,na.rm = TRUE),x)))
Cars93_7

# (9) 그룹 별 평균값으로 결측값 대체하기 (filling missing values by group mean)
# make a sample DataFrame
grp <- c(rep('a',5),rep('b',5))
val <- c(1,2,3,NaN,6,2,4,NaN,10,8)
df <- data.frame(grp,val)
df

# mean value by gropu 'a' and 'b'
library(dplyr)
# library(magrittr)
df %>% group_by(grp) %>% summarise(grp_mean = mean(val, na.rm = TRUE))

df %>%
  group_by(grp) %>%
  mutate(val = ifelse(is.na(val),mean(val,na.rm = TRUE),val))

my_data <- c(-1,0,10,NA,NaN,Inf)
my_data
is.finite((my_data)) #is.finite : 유한값 확인
is.na(my_data) #is.na : 결측값 확인
is.nan(my_data) #is.nan : NaN(Not a Number) : 수학적으로 정의가 되지 않는 것을 의미
is.infinite(my_data) #is.infinite : Inf(Infinity) 무한값 확인

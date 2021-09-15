# (1) tapply() : 요인의 수준별로 특정 벡터에 함수 명령어를 동시에 적용
library(MASS)
str(Cars93)

# 차량 Type별 고속도로 연비 평균
with(Cars93, tapply(MPG.highway,Type,mean))
# 차량 Type별 고속도로 연비 표준편차
with(Cars93, tapply(MPG.highway,Type,sd))

# (2) sapply() : 데이터 프레임 여러 변수에 함수 명령어 동시 적용
# (결과는 벡터 또는 행렬)
sapply(Cars93, class)

# (3) lapply() : 데이터 프레임 여러 변수에 함수 명령어 동시 적용
# (결과는 리스트)
lapply(Cars93,class)

var_1 <- c(1:3)
var_2 <- c(4:6)
var_3 <- c(7:9)
df <- data.frame(var_1,var_2,var_3)
df

# change all column names from "var_" to "x_" using lapply() & lambda function
colnames(df) <- lapply(colnames(df), function(x) {gsub("var_", "X_", x)})

df

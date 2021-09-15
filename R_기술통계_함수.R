# (1)평균 : mean(x)
x <- c(1,2,3,4,5,6,7,8,9,10)
mean(x)

# (2)중앙값 : median(x)
x <- c(1,2,3,4,5,6,7,8,9,10)
median(x)
y <- c(1,2,3,4,5,6,7,8,9)
median(y)

# (3)최소값 : min(x)
min(x)
min(y)

my_vec <- c(5,3,10,3,-12,NA)
my_vec
min(my_vec)
which.min(my_vec) # index of min value in 'my_vec'vector
my_vec[which.min(my_vec)]

# (4)최대값 : max(x)
max(x)
max(y)

my_vec <- c(-5,3,10,3,-12,NA)
my_vec

max(my_vec)
which.max(my_vec) # index of max value in 'my_vec' vector
my_vec[which.max(my_vec)]

# (5) : range(x)
range(x)
range(y)

# (6)IQR(Inter-Quartile Range) : IQR(x)
IQR(x)
IQR(y)

# (7)중심화 경향 및 분포 요약 : summary(x)
summary(x)

# (8)분산 : var(x)
var(x)
var(y)

# (9)표준편차 : sd(x)
sd(x); sd(y)

# (10)왜도
install.packages("fBasics") # 왜도, 첨도 분석 가능한 package 설치
library(fBasics) #package 호출출
hist(mtcars$mpg)

skewness(mtcars$mpg)

# (11)첨도
kurtosis(mtcars$mpg)

# (12)합 : sum(x)
sum(x)
sum(y)

# (13)n차 차분 : diff(x, lag=n)
diff(x, lag=1)
diff(x, lag=2)
diff(x, lag=3)

# (14)길이, 관측값 개수 : length()
#벡터에 length() 사용시
length(x)
length(y)

# 데이터 프레임에 length()사용 시
length(mtcars)

# 데이터 프레임의 특정 변수에 length($) 사용 시
length(mtcars$mpg)

# (15)순위 : rank()
rank(x)
rank(-x)

mtcars$mpg
rank(mtcars$mpg,
     na.last = TRUE,
     ties.method = c("max"))

##----------------------
## rank() {base package}
##----------------------

# if there are no ties(i.e., equal values), no problem at all
x <- c(1,5,9,7)
rank(x)

# if there are ties, ties can be handled in several ways
y <- c(1,1,1,5,9,7)

# returns average, default setting
rank(y)
rank(y, ties.method = c("average"))

# first occurence wins
rank(y, ties.method = c("first"))

#ties broken at random
rank(y, ties.method = c("random"))
rank(y, ties.method = c("random")) # ...random one more time
rank(y, ties.method = c("random")) # ...random...again

#rank by max value as used classically
rank(y,ties.method = c("max"))

#rank by min value as in Sports
rank(y, ties.method = c("min"))

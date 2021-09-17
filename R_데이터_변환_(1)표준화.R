# R 데이터 변환 (1) 표준화 : Z표준화 변환, [0-1] 변환


# (1-1) 표준정규분포 z 변환
## 한국인, 부시맨 각 성인 1000명 키 데이터 생성

height_korean <- rnorm(n = 1000, mean = 170, sd = 10)
height_bushman <- rnorm(n = 1000, mean = 150, sd = 8)

height <- data.frame(height_korean, height_bushman) # 데이터 프레임 생성성
head(height) # 상위 6개 데이터 확인인

## 한국인, 부시맨 키 히스토그램
attach(height)
par(mfrow = c(1,2))
hist(height_korean, freq = TRUE, main = "한국인 키 빈도 히스토그램")
hist(height_korean, freq = FALSE, main =  "한국인 키 확률밀도함수 그래프")

hist(height_bushman, freq = TRUE, main = "부시맨 키 빈도 히스토그램")
hist(height_bushman, freq = FALSE, main = "부시맨 키 확률밀도함수 그래프프")

detach(height)

## a. scale() 함수
height <- transform(height,
                    z.height_korean = scale(height_korean),
                    z.height_bushman = scale(height_bushman)
                    )
head(height)

## b. z=(x-mean(x))/sd(x)
height <- transform(height,
                    z2.height_korean = (height_korean - mean(height_korean))/sd(height_korean),
                    z2.height_bushman = (height_bushman - mean(height_bushman))/sd(height_bushman)
                    )
head(height)

hist(height$z.height_korean, freq = TRUE, main = "standized freq. of Korean H")
hist(height$z.height_bushman, freq = TRUE, main = "standized freq. of Bushman H")


# (1-2) [0-1] 변환
# [0-1] 변환은 (x-min(x))/(max(x)-min(x))
## [0-1] transformation
height <- height[,c(1:2)]
library(reshape)
height <- rename(height,c(height_korean = "h_kor", height_bushman = "h_bush"))
head(height)

height <- transform(height,
                    h_kor_01 = (h_kor - min(h_kor))/(max(h_kor)-min(h_kor)),
                    h_bush_01 = (h_bush - min(h_bush))/(max(h_bush)-min(h_bush))
                    )
head(height)

hist(height$h_kor_01)
hist(height$h_bush_01)


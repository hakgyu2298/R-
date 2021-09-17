library(UsingR)

data(cfb) # cfb 데이터 불러오기기
head(cfb) # 상위 6개 미리보기기

summary(cfb$INCOME) # INCOME 요약통계량량

hist(cfb$INCOME, breaks = 500, freq = TRUE) # INCOME 히스토그램램

# (1) 로그 변환 : log()
cfb <- transform(cfb,INCOME_log = log(INCOME + 1))
hist(cfb$INCOME_log, breaks = 500, freq = TRUE)

# (2) 제곱근 변환 : sqrt()
cfb <- transform(cfb, INCOME_sqrt = sqrt(INCOME+1))
hist(cfb$INCOME_sqrt, breaks = 500, freq = TRUE) #breaks = 500 : 499개의 bin

## Q-Q plot(정규성 검정을 할 때 사용)
par(mfrow = c(1,3))
qqnorm(cfb$INCOME, main = "Q-Q plot of INCOME")
qqline(cfb$INCOME)

qqnorm(cfb$INCOME_log, main = "Q-Q plot of INCOME_log")
qqline(cfb$INCOME_log)

qqnorm(cfb$INCOME_sqrt, main = "Q-Q plot of INCOME_sqrt")
qqline(cfb$INCOME_sqrt)
par(mfrow = c(1,1))

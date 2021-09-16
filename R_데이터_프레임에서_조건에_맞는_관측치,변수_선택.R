help(mtcars)
str(mtcars)
head(mtcars)

# (1) indexing & which() 함수를 활용한 특정 조건을 만족하는 변수, 관측치 선택
attach(mtcars)

# (a) 변속기가 자동이고 & 실린더가 4개, 6개인 자동차의 연비, 실린더, 자동/수동 변수 선별
mtcars_mart_0 <- mtcars[which(am == 0 & cyl %in% c(4,6)),c("mpg","cyl","am")]
mtcars_mart_0

mean(mtcars_mart_0$mpg)

# (b) 변속기가 수동이고 & 실린더가 4개, 6개인 자동차의 연비, 실린더, 자동/수동 변수 선별
mtcars_mart_1 <- mtcars[which(am == 1 & cyl %in% c(4,6)), c("mpg","cyl","am")]
mtcars_mart_1
mean(mtcars_mart_1$mpg)

detach(mtcars)

mtcars_mart_9 <- mtcars[which(mtcars$am == 0 & mtcars$cyl %in% c(4,6)),c(1,2,9)]
mtcars_mart_9

# (2) subset(Data 이름, select = c(변수명), subset = (선별 조건)) 변수, 관측치 선택

# (a) 변속기가 자동이고 & 실린더가 4개 or 6개인 자동차의 연비, 실린더, 자동/수동 변수 선별
mtcars_subset_0 <- subset(mtcars,
                          select = c(mpg, cyl, am),
                          subset = (am == 0 & cyl %in% c(4,6)))
mtcars_subset_0

# %in% 대신 '|'(or)를 써서 할 수 있음
subset(mtcars,
       select = c(mpg, cyl, am),
       subset = ((am == 0 & cyl == 4)|(am == 0 & cyl == 6))
       )

# (b) 변속기가 수동이고 & 실린더가 4개 or 6개인 자동차의 연비, 실린더, 자동/수동 변수 선별
mtcars_subset_1 <- subset(mtcars,
                          select = c(mpg, cyl, am),
                          subset = (am == 1 & cyl %in% c(4,6)))
mtcars_subset_1
mean(mtcars_subset_1$mpg)

# 연속 선택 : c(1:5)
mtcars_subset_1_5 <- subset(mtcars,
                            select = c(1:5)
                            )
head(mtcars_subset_1_5)

# 제외 : -c()
mtcars_subset_6_11 <- subset(mtcars,
                             select = -c(1:5)
                             )
head(mtcars_subset_6_11)

# (3) dplyr 패키지의 select() 로 변수 선택, filter(0로 조건에 맞는 관측치 선택, summarize() 요약 통계량 계산
library(dplyr)

# (a) 변속기가 자동(am == 0)이고 실린더가 4개 or 6개인 자동차의 평균 연비
mtcars %>% select(mpg, cyl, am) %>% filter(am ==0 & cyl %in% c(4,6))

mtcars %>% select(mpg, cyl, am) %>% filter(am == 0 & cyl %in% c(4,6)) %>% summarise(mean(mpg))

# (b) 변속기가 수동(am == 1)이고 & 실린더가 4개 or 6개인 자동차의 평균 연비
mtcars %>% select(mpg, cyl, am) %>% filter(am ==1 & cyl %in% c(4,6))

mtcars %>% select(mpg, cyl, am) %>% filter(am == 1 & cyl %in% c(4,6)) %>% summarise(mean(mpg))

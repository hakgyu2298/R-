library(MASS)
str(Cars93) # 데이터 구조 데이터 프레임, 관측치 93개, 변수 27개
head(Cars93) # 상위 6개 관측치

# 함수 명령문 형식 : with(dataset, tapply(numeric vector, factor, function))
with(Cars93,tapply(MPG.highway, Type, mean))

install.packages("ggplot2") # ggplot2 패키지 설치
library(ggplot2) # ggplot2 패키지 호출
# 명령식 형식 : qplot(nemeric vector, data = dataset, facets=factor~., binwidth = n)
qplot(MPG.highway, data = Cars93, facets = Type~., binwidth=2)



# (1) stringsAsFactor = FALSE로 한 경우
cust_profile_1 <- read.table("C:/Users/krm/Desktop/자료/R_script/실습파일/cust_profile_2.txt",
                             header = TRUE,
                             sep = ",",
                             stringsAsFactor = FALSE,
                             na.strings = "")

is.character(cust_profile_1$cust_id) # 문자형 여부 속성 확인인
is.character(cust_profile_1$last_name)
is.numeric(cust_profile_1$age) # 숫자형 여부 속성 확인
is.factor(cust_profile_1$gender) # 요인형 여부 속성 확인

sapply(cust_profile_1,class)

cust_profile_1$gender <- as.factor(cust_profile_1$gender)
is.factor(cust_profile_1$gender)

# level check
levels(cust_profile_1$gender)

# change level's name from {"F","M"} to {"FEMALE","MALE"}
levels(cust_profile_1$gender) <- c("FEMALE","MALE")
levels(cust_profile_1$gender)

#factor() 함수와 labels 옵션을 사용
cust_profile_1$gender <- factor(cust_profile_1$gender,labels = c("FEMALE","MALE"))

# (2) stringsAsFactor = TRUE로 한 경우(요인으로 인식하라는 옵션)
cust_profile_2 <- read.table("C:/Users/krm/Desktop/자료/R_script/실습파일/cust_profile_2.txt",
                             header = TRUE,
                             sep = ",",
                             stringsAsFactor = FALSE,
                             na.strings = "")
sapply(cust_profile_2,class)

cust_profile_2$cust_id <- as.character(cust_profile_2$cust_id)
cust_profile_2$age <- as.numeric(cust_profile_2$age)
sapply(cust_profile_2, class)
cust_profile_2$gender<- as.factor(cust_profile_2$gender)

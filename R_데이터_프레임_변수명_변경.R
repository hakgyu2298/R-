# (1) 데이터 프레임 변수명 변경 names()

## 데이터 프레임 변수명 변경 rename()
library(MASS)
# Cars93 데이터 프레임 내 변수명 확인
names(Cars93)

# Cars93 데이터 프레임의 1~5번째 변수만 선택한 후 names()로 변수명 변경
Cars93_subset <- Cars93[,c(1:5)]
names(Cars93_subset)

names(Cars93_subset) <- c("V1","V2","V3","V4","V5")
names(Cars93_subset)

# (2-1) 데이터 프레임 변수명 변경 : reshape 패키지의 rename() 함수
# rename()
library(reshape)
Cars93_subset <- rename(Cars93_subset,
                        c(V1 = "V1_Manufacturer",
                          V2 = "V2_Model",
                          V3 = "V3_Type",
                          V4 = "V4_Min.Price",
                          V5 = "V5_Price"
                          )
                        )

Cars93_subset

# (2-2) 데이터 프레임 변수명 변경 : plyr 패키지의 rename() 함수
library(plyr)
Cars93_subset <- rename(Cars93_subset,
                        c("V1_Manufacturer" = "Manufacturer",
                          "V2_Model" = "Model",
                          "V3_Type" = "Type",
                          "V4_Min.Price" = "Min.Price",
                          "V5_Price" = "Price"
                          )
                        )

# (2-3) 데이터 프레임의 변수명 변경 : dplyr 패키지의 rename() 함수
# plyr 패키지의 rename() 함수와 비교하여 dplyr 패키지의 rename()함수의 차이점은
# 1. 새로운 변수명이 앞, 이전 변수명이 뒤
# 2. 큰 따옴표 사용 X
# 3. 바꾸고자 하는 변수가 여러 개 있을 때, c()로 안묶고 ","(comma)로 나열
# dplyr package, rename(dataframe, new_Var1 = old_Var1, new_Var2 = old_Var2,...)
library(dplyr)

Cars93_2 <- Cars93[,c(1:3)]
names(Cars93_2)
Cars93_3 <- rename(Cars93_2,
                   new_Manufacturer = Manufacturer,
                   New_Model = Model,
                   New_Type = Type)
names(Cars93_3)

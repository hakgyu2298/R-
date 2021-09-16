# R 벡터, 데이터 프레임 정렬 : sort(), order()
v1 <- c(40,30,50,50,90,40,50)
v2 <- c(5100,6500,2000,2000,9000,4500,3000)
v3 <- c("A","B","A","B","A","A","B")
v123 <- data.frame(v1,v2,v3)
v123

# (1) 숫자 자체 정렬 sort()
v1
sort(v1) # 오름차순 정렬
sort(v1, decreasing = TRUE) # 내림차순 정렬렬

# (2) 정렬 색인 값 order()
v1
order(v1)
v1[order(v1)] # sort(v1)과 결과 동일
## order()는 데이터 프레임에서의 정렬에서 사용함 (sort()는 데이터 프레임에서는 사용할 수 없음)

# rm(v1,v2,v3) # 벡터 v1, v2, v3 제거
attach(v123) # 데이터 프레임 활성화화

# v123 데이터 프레임의 전체 행을 v1 오름차순, v2 내림차순, v3 오름차순의 순서대로 정렬
v123_order <- v123[order(v1,-v2,v3),]

v123 # 원래 데이터셋
v123_order # 정렬된 후의 데이터 셋셋

detach(v123)

# 정렬된 후의 데이터프레임 v123_order의 제일 왼쪽 row.names가 order(v1, -v2, v3)의 색인 결과와 같게
# 정렬이 되어 있음.
order(v1,-v2,v3)
row.names(v123_order)

# plyr 패키지의 arrange(0 함수를 사용하여 정렬, 정렬하고자 할 경우에는 desc()옵션을 추가
library(plyr)
arrange(v123,v1,desc(v2),v3)

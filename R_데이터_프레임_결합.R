# (1)행 결합 (위+아래) : rbind(A,B)
## 데이터 프레임 생성
cust_id <- c("c01","c02","c03","c04")
last_name <- c("kim","Lee","Choi","Park")
cust_mart_1 <- data.frame(cust_id, last_name)

cust_mart_1

cust_mart_2 <- data.frame(
  cust_id = c("c05","c06","c07"),
  last_name = c("Bae","Kim","Lim")
)

cust_mart_2

## (1) 행 결합 (위 + 아래) rbind(A,B)
cust_mart_12 <- rbind(cust_mart_1,cust_mart_2)

cust_mart_12

cust_mart_3 <- data.frame(
  cust_id = c("c08","c09"),
  last_name = c("Lee","Park"),
  gender = c("F","M")
)
cust_mart_3

## --error
rbind(cust_mart_12,cust_mart_3)
#컬럼의 갯수가 서로 다르기 때문에

cust_mart_4 <- data.frame(
  cust_id = c("c10","c11"),
  first_name = c("Kildong", "Yongpal")
)

cust_mart_4

## -- error
rbind(cust_mart_12,cust_mart_4)
#칼럼의 이름이 같지 않기에

# 열 결합(왼쪽+오른쪽) : cbind(A,B)
## --(2) 열 결합 cbind(A,B)
cust_mart_5 <- data.frame(
  age = c(20,25,19,40,32,39,28),
  income = c(2500, 2700, 0, 7000, 3400, 3600, 2900)
)
cust_mart_12
cust_mart_5

cust_mart_125 <- cbind(cust_mart_12, cust_mart_5)
cust_mart_125

# -- error
# cbind()를 하는데 있어 행의 갯수가 서로 다르다면 에러 발생
cust_mart_6 <- data.frame(
  age = c(34,50),
  income = c(3600,5100)
)
cbind(cust_mart_125,cust_mart_6)

# (3) 동일 key 값 기준 결합 : merge(A,B,by='key)
# 각 행의 관찰치가 서로 동일한 것도 있고 그렇지 않은 것도 섞여 있다면 merge() 사용

#cbind()의 잘못된 예
cust_mart_12

cust_mart_7 <- data.frame(
  cust_id = c("c03","c04","c05","c06","c07","c08","c09"),
  buy_cnt = c(3,1,0,7,3,4,1)
)
cust_mart_7

cust_mart_127_cbind <- cbind(cust_mart_12, cust_mart_7)
cust_mart_127_cbind
# "C01", "C02","C08","C09"가 결합하는 현상 발생

# (3-1) merge() : Inner Join

cust_mart_127_innerjoin <- merge(
  x = cust_mart_12,
  y = cust_mart_7,
  by = "cust_id"
)
cust_mart_127_innerjoin

# (3-2) merge()-Outer Join
cust_mart_127_outerjoin <- merge(
  x = cust_mart_12,
  y = cust_mart_7,
  by = 'cust_id',
  all = TRUE
)
cust_mart_127_outerjoin

# (3-3) merge() : Left Outer Join
cust_mart_127_leftouter <- merge(
  x = cust_mart_12,
  y = cust_mart_7,
  by = 'cust_id',
  all.x = TRUE
)

# (3-4) merge() : Right Outer Join
cust_mart_127_rightouter <- merge(
  x = cust_mart_12,
  y = cust_mart_7,
  by = 'cust_id',
  all.y = TRUE
)
cust_mart_127_rightouter

## --error :3개 이상의 데이터 셋에 대해서 key 값 기준 merge()결합을 하려고 하면 에러 발생
merge(cust_mart_12,cust_mart_5,cust_mart_7, by = 'cust_id')
#데이터 프레임 2개씩 key 값 기준으로 순차적으로 merge()해나가야 됨.
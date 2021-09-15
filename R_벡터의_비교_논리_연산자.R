# (1) ~보다 크다 : >
aa <- c(1,2,3,4,5,6,7) #벡터
bb <- c(7,6,5,4,3,2,1) #벡터
cc <- c(4) #스칼라

aa>bb
aa>cc
# 벡터끼리 연산할 대도 서로 개수가 다르면 개수가 작은 쪽이 순환연산이 
이루어져 서로 짝을 맞추어서 연산이 실행

# (2) ~보다 크거나 같다 : >=
aa >= bb
aa >= cc

# (3) ~보다 작다 : <
aa < bb
aa < cc

# (4) ~보다 작거나 같다 : <=
aa <= bb
aa <= cc
aa =< cc

# (5) 서로 같다 : ==
aa == bb
aa == cc

# (6) 서로 같지 않다 : !=
aa != bb
aa != cc
aa =! cc


# (7) 동시에 조건 만족 (aa AND bb) : aa & bb
aa <- c(1,2,3,4,5,6,7) # 벡터
bb <- c(7,6,5,4,3,2,1) # 벡터
cc <- c(4) #스칼라

aa > 3 & aa < 6
aa >= 3 & aa<=6

# (8) 또는 조건 만족 (aa OR bb) : aa | bb
aa < 3 | aa > 6
aa <= 3 | aa >= 6

# (9) 조건 만족하는 논리형 벡터에 대한 합계, 평균 :sum(), mean()
sum(aa > 3 & aa < 6)
sum(aa < 3 | aa > 6)
mean(aa > 3 & aa < 6)
mean(aa < 3 | aa > 6)

# (10) 비교/논리 연산 결과에 대해 하나라도 (any) 혹은 전부(all) TRUE가 있는지 
# 여부 확인 : any(), all()
any(aa > 3 & aa < 6)
all(aa > 3 & aa < 6)
any(aa > 8)
any(aa == 1)
all(aa == 1)

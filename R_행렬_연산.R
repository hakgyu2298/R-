# (1) 행렬 내 각 숫자끼리의 연산 : +,-,*,/,^

## 행렬 X와 행렬 Y 생성
X <- matrix(1:4, nrow = 2, ncol = 2, byrow = FALSE,dimnames = NULL)
X

Y <- matrix(5:8, nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)
Y

## 행렬 X와 행렬 Y의 각 숫자끼리의 연산: +,-,*,/,^
X+Y
X-Y
X*Y # 각 구성 원소를 순서대로 곱함
X/Y # 각 구성 원소를 순서대로 나눔
X^Y # 각 구성 원소를 순서대로 거듭제곱함

# (2) 행렬 X와 행렬 Y의 곱 : X %*% Y
X %*% Y

# (3) 행렬 세로 결합 cbind(), 행렬 가로 결합 rbind()
## 행렬 세로 결합 cbind() : column bind
cbind(X,Y)

## 행렬 가로 결합 rbind() : row bind
rbind(X,Y)

# (4) 행렬 X의 각 열의 평균값으로 구성된 벡터 colMeans(X), 행렬 Y의 각 행의 평균값으로 구성된 벡터 rowMeans(Y)
# colMeans(X), rowMeans(X)
colMeans(X)
rowMeans(X)

colMeans(Y)
rowMeans(Y)

# (5) 행렬 X의 각 열의 합계로 구성된 벡터 colSums(X), 행렬 Y의 각 행의 합계로 구성된 벡터 rowSums(Y)
colSums(X)
rowSums(X)

colSums(Y, na.rm = TRUE)
rowSums(Y, na.rm = TRUE)

# na.omit() 함수와 동일하게 행 내에 결측값이 있으면 그 행 전체를 삭제하는 방법(rowSums()함수와 is.na() 함수 사용)
library(MASS)
str(Cars93)

sum(is.na(Cars93))
Cars93_na.omit <- na.omit(Cars93)
sum(is.na(Cars93_na.omit))

Cars93_rowSums <- Cars93[rowSums(is.na(Cars93)) == 0, ] #NA가 없으면 각 행의 합이 0이 나옴
sum(is.na(Cars93_rowSums))

# (6) 행렬 X의 전치 t(X)
X
t(X)

Y
t(Y)

Z <- matrix(1:6, nrow = 2, ncol = 3)
Z
t(Z)

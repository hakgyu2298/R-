# (1) nchar(x) : 문자형 벡터 x의 구성요소 개수 구하기
x <- c("Seoul","New York","London","1234")
nchar(x) #"New York"의 경우에도 스페이스바 공간 하나도 개수를 세서 8로 계산

# (2) substr(x, start, stop) : 문자형 벡터 x의 start에서부터 stop까지만 잘라오기(부분선택)
# substr()로 문자형 벡터 부분 선택하기
time_stamp <- c("201507251040","201507251041","201507251042","201507251043","201507251044")
t_yyyymm <- substr(time_stamp,1,6)
t_yyyymm

# 데이터 프레임에서 Transform()함수와 substr()함수로 부분 선택한 내용으로 새로운 변수 만들기
gas_temp <- c(145.0, 145.1, 145.5, 150.1, 150.6)
ts_gas_temp <- data.frame(time_stamp,gas_temp)
ts_gas_temp

ts_gas_temp <- transform(ts_gas_temp,mmdd = substr(time_stamp,5,8))
ts_gas_temp <- transform(ts_gas_temp,hhmm = substr(time_stamp,9,12))

ts_gas_temp

# (3) paste(x,y,sep = " ") : 문자형 벡터 x와 y를 붙이기
# 문자형 벡터의 객체들을 paste()로 하나로 붙이기
paste("I","Love","New York", sep = "")
paste("I","Love","New York", sep = " ")
paste("I","Love","New York", sep = "_")

# 데이터 프레임에서 transform()함수와 paste()함수로 두 개의 변수를 하나로 합쳐서 새로운 변수 만들기

ts_gas_temp <- transform(ts_gas_temp, mmddhhmm = paste(mmdd, "일_", hhmm, "분", sep=""))
ts_gas_temp


# (4-1) strsplit(x, split = ",") : 문자형 벡터 x를 split 기준으로 해서 나누기
# strsplit()으로 분리하기
name <- c("Chulsu,Kim","Younghei,Lee","Dongho,Choi")
name_split <- strsplit(name,split = ",")
name_split
class(name_split)
# indexing 해오기
last_name <- c(name_split[[1]][2],name_split[[2]][2],name_split[[3]][2])
last_name

first_name <- c(name_split[[1]][1],name_split[[2]][1],name_split[[3]][1])
first_name

#last name과 first_name, name을 데이터 프레임으로 묶기
name_d.f <- data.frame(last_name,first_name, name)
name_d.f

# (4-2) 데이터프레임에서 문자열을 구분자 기준으로 나누는 방법(spliting character in dataframe by delimeter)
# : data.frame(do.call('rbind',strsplit(as.character(df$var),split-'delimeter',fixed=T)))

#####################################################
#####split character in dataframe by delimeter#######
#####################################################

#example data frame
name_df <- data.frame(ID = c(1:3), name = c("Chulsu/Kim","Younghei/Lee","Dongho/Choi"))
name_df

# strsplit character in dataframe by delimeter
name_strsplit <- data.frame(do.call('rbind',
                                    strsplit(as.character(name_df$name),
                                             split = '/',
                                             fixed = TRUE)))
name_strsplit

# changing name
#install.packages("reshape")
library(reshape)
name_strsplit <- rename(name_strsplit,
                        c(X1 = "Frist_Name",
                          X2 = "Last Name"))
name_strsplit

# (5) sub(old,new,x) : 문자형 벡터 x에서 처음 나오는 old 문자를 new 문자로 한 번만 바꾸기
# (6) gsub(old, new, x) : 문자형 벡터 x 내에 모든 old 문자를 new 문자로 모두 바꾸기

# sub()는 처음 나오는 old 문자만 new 문자로 한 번만 바꿈
z <- c("My name is Chulsu. What's your name?")
sub("name","first name",z)

# gsub()는 모든 old 문자를 new 문자로 바꿈
gsub("name", "first name", z)

# new 자리에 ""를 넣으면 없애는 효과
sub("My name is Chulsu.","",z)

# 데이터 프레임에서 transform()함수로 sub()함수를 사용해서 특정 변수 내 특정 문자열을 old->new로 바꾸기

cust_id <- c("c1","c2","c3","c4","c5","c6")
size <- c("Xs","L","M","XS","XL","S")
cust_db <- data.frame(cust_id,size)
cust_db

# size 변수"XS" 사이즈를 "S" 사이즈로 바꿔서 size_1 이라는 새로운 변수에 저장(생성)
cust_db <- transform(cust_db,size_1 = sub("XS","S",size))
cust_db


# 문자열에 포함되어 있는 모든 점(".",point)을 없애려면 gsub(".","",col, fixed=TRUE)라고 하거나,
# 혹은 정규 표현식을 이용해서 gsub("[.]","",col) 이라고 해야된다.
# how to remove a point "." in a string
id <- c("a","b","c","c")
col <- c("11.23","64.12","931.01","3.3.0.4.1.2")
df <- data.frame(id,col)
df

df <- transform(df,
                col_2 = gsub(".","",col,fixed = TRUE))
df
df <- transform(df,
                col_3 = gsub("[.]","",col))
df

# (7) grep(pattern,x) : 문자열 벡터에서 특정 부분 문자열 패턴 찾기
grep("1010",c("1001","1010","1110","101000")) # 2번째와 4번째 원소에 패턴이 있음
grep("1010",c("1001","1009","1110","100000")) # 패턴이 하나도 안들어 있다는 의미

# (8) regexpr() : text 내에서 패턴이 가장 먼저 나오는 위치 찾기
regexpr("NY","I love Ny and I'm from NY")

# (9) gregexpr() : text 내에서 패턴이 나오는 모든 위치를 찾기
gregexpr("NY", "I love NY and I'm from NY")

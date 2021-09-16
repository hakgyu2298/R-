# 연속형 변수를 범주형 변수로 변호나하기 : cut(), ifelse(), within()

## (1) cut()
# 통계시험 점수 (stat_score)
student_id <- c("s01","s02","s03","s04","s05","s06","s07","s08","s09","s10")
stat_score <- c(56,94,82,70,64,82,78,80,76,78)
mean(stat_score)
hist(stat_score)

# 데이터 프레임 생성
score_d.f <- data.frame(student_id,stat_score)
score_d.f

#rm(student_id,stat_score)

## (1) cut()
score_d.f <- transform(score_d.f,
                       stat_score_1 = cut(stat_score, breaks = c(0,60,70,80,90,100),
                                          include.lowest = TRUE,
                                          right = FALSE,
                                          labels = c("가","양","미","우","수")
                                          ),
                       stat_score_2 = cut(stat_score, breaks = c(0,60,70,80,90,100),
                                          include.lowest = TRUE,
                                          right = FALSE,
                                          labels = c("가","양","미","우","수")
                                          ),
                       stat_score_3 = cut(stat_score, breaks = c(0,60,70,80,90,100),
                                          include.lowest = TRUE,
                                          right = FALSE,
                                          labels = c("가","양","미","우","수")
                                          ),
                       stat_score_4 = cut(stat_score, breaks = c(0,60,70,80,90,100),
                                          include.lowest = TRUE,
                                          right = FALSE,
                                          labels = c("가","양","미","우","수")
                                          )
                       )
# cut() 함수 argument
# right = TRUE 옵션 : a < x <= b 오른쪽 숫자까지 포함하여 해당 등급을 부여
# right = FALSE 옵션 : a <= x < b, 의 조건으로 등급을 부여, include.lowest = TRUE 옵션 : 구성요소 값이  값이 최소값과 같아도 변환


score_d.f

## (2) ifelse()
attach(score_d.f)
score_d.f <- transform(score_d.f,
                       stat_score_5 = ifelse(stat_score <60, "가", 
                                              ifelse( stat_score >= 60 & stat_score <70, "양",
                                              ifelse(stat_score >= 70 & stat_score <80, "미",
                                              ifelse(stat_score >= 80 & stat_score <90, "우","수"))))
                       )
detach(score_d.f)
score_d.f

sapply(score_d.f, class)
score_d.f$stat_score_5<- as.factor(score_d.f$stat_score_5)
sapply(score_d.f, class)

## (3) within()
score_d.f <- within(score_d.f,{
  stat_score_6 = character(0) # 문자형 변수 신규생성/지정
  stat_score_6[stat_score < 60] = "가"
  stat_score_6[stat_score >= 60 & stat_score < 70] = "양"
  stat_score_6[stat_score >= 70 & stat_score < 80] = "미"
  stat_score_6[stat_score >= 80 & stat_score < 90] = "우"
  stat_score_6[stat_score >= 90] = "수"
  
  stat_score_6 = factor(stat_score_6, level = c("수","우","미","양","가"))
})

score_d.f$stat_score_6
score_d.f

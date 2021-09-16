# 데이터 프레임 신규 변수 생성 : dataframe$variable, tansform()
# (1) dataframe$variable

height <- c(175,159,166,189,171,173,179,167,182,170)
weight <- c(62,55,59,75,61,64,63,65,70,60)
h_w_d.f <- data.frame(height, weight)
h_w_d.f

options(digits = 4) # 숫자 개수 지정해주는 옵션.
h_w_d.f$bmi_1 <- h_w_d.f$weight/(h_w_d.f$height/100)^2
h_w_d.f

# (2) transform(dataframe, new_variable = 수식)
## transform()
h_w_d.f <- transform(h_w_d.f,
                     bmi_2 = weight/(height/100)^2)
h_w_d.f

options(digits = 3)
h_w_d.f <- transform(h_w_d.f,
                     bmi_sqrt = sqrt(bmi_2),
                     bmi_log10 = log10(bmi_2)
                     )
View(h_w_d.f)

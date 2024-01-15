# Comparison of the Distribution of Recreation Forests in Korea

# 엑셀 파일 로드
library(readxl)

forest_example_data <- read_excel("C:/R_data/forest_example_data.xls")

colnames(forest_example_data) <- c("name", "city", "gubun", "area",
                                   "number", "stay", "city_new",
                                   "code", "codename")

# forest_example_data 정보
str(forest_example_data)
head(forest_example_data)
# 컬럼은 총 9개, 관측치 213개로 이루어진 데이터임을 확인할 수 있습니다.

# 빈도 분석 - freq() 활용
library(descr)
freq(forest_example_data$city, plot=T, main="city")

# 빈도 분석 - table() 활용
city_table <- table(forest_example_data$city)
city_table
barplot(city_table) 

# 휴양림이 가장 많은 지역 순으로 정렬
library(dplyr)

# 시도별 휴양림 빈도 분석
count(forest_example_data, city) %>% arrange(desc(n))
# 휴양림이 가장 많은 지역은 경상남도, 두 번째는 충청북도임을 확인 가능

# 소재지_시도명 컬럼으로 시도별 분포 확인 
count(forest_example_data, city_new) %>% arrange(desc(n))
# 전라 북도와 충청 남도의 빈도수 변화가 생겼다. 
# 세종 특별자치시가 추가 되었다. 

# 제공기관명 컬럼으로 시도별 분포 확인
count(forest_example_data, codename) %>% arrange(desc(n))
# '도'를 기준으로 나누었던 city와 city_new 컬럼과 달리 codename 컬럼에서는 '군' 이나 '시' 단위의 데이터가 섞여서 빈도분석이 실행되었음을 확인할 수 있음.

# 즉, 어떤 값이 들어있는 컬럼을 분석하느냐에 따라 데이터 분석 결과가 달라짐.
# 데이터 컬럼과 컬럼 값에 대해 명확하게 정의한 후 도출하고자 하는 결괏값을 분석 필요.
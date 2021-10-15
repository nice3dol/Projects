#####################################################################################################
# Script id   : 바란다.R
# Script Name : 바란다 분석 
# Input       : C:/01.Project/01.분석참조모델/Rscript/바란다
#		00. Load R Sources.R / 01. Load Data.R / 02. Preprocessing.R / 03. EDA.R / 04. SNA.R /
#		05-1-1. keyword_DT.R / 05-1-2. keyword_DTM.R / 05-2. keyword_aruls.R /
#		05-3-1. find_topic_N.R / 05-3-2. keyword_topic.R / 09. Tableau.R /
#		load_library.R / make_dtm.R / morph_analysis.R / preprocessing.R
# Output      : C:/01.Project/01.분석참조모델/Result/바란다/
# Author      : 펜타시스템
#####################################################################################################
## 00. R 소스 불러오기 (Load R Sources)
#####################################################################################################
source('C:/01.Project/01.분석참조모델/Rscript/바란다/00. Load R Sources.R', encoding = "UTF-8")

#####################################################################################################
## 01. 데이터 불러오기 (Load Data Files)
#####################################################################################################
source('C:/01.Project/01.분석참조모델/Rscript/바란다/01. Load Data.R', encoding = "UTF-8")

#####################################################################################################
## 02. 데이터 전처리 (Data Preprocessing)
#####################################################################################################
source('C:/01.Project/01.분석참조모델/Rscript/바란다/02. Data_Preprocessing.R', encoding = "UTF-8")
save(re_DT, file="C:/01.Project/01.분석참조모델/Data/RData/anal.df_바란다.RData")

#####################################################################################################
## 03. 현황분석 (EDA)
#####################################################################################################
source('C:/01.Project/01.분석참조모델/Rscript/바란다/03. EDA.R', encoding = "UTF-8")

#####################################################################################################
## 04. 소셜 네트워크 분석 (SNA : Social Network Analysis)
#####################################################################################################
source('C:/01.Project/01.분석참조모델/Rscript/바란다/04. SNA_dtm.R', encoding = "UTF-8")
dtmx <- removeSparseTerms(dtm_내용_전체민원, 0.925)	# term의 갯수를 조정
SNA_dtm(dtm = dtmx)

#####################################################################################################
## 05. 특정 키워드 분석
#####################################################################################################
# 0) 소스 불러오기
# EDA
source('C:/01.Project/01.분석참조모델/Rscript/바란다/05-1-1. keyword_DT.R', encoding = "UTF-8")
source('C:/01.Project/01.분석참조모델/Rscript/바란다/05-1-2. keyword_DTM.R', encoding = "UTF-8")
# 연관성 분석 (Association Rules)
source('C:/01.Project/01.분석참조모델/Rscript/바란다/05-2. keyword_aruls.R', encoding = "UTF-8")
# 토픽 분석 (Topic Modeling)
source('C:/01.Project/01.분석참조모델/Rscript/바란다/05-3-1. find_topic_N.R', encoding = "UTF-8")
source('C:/01.Project/01.분석참조모델/Rscript/바란다/05-3-2. keyword_topic.R', encoding = "UTF-8")

# 1) 컴퓨터
re_DT_컴퓨터 <- keyword_DT(keyword = '컴퓨터')
dtm_컴퓨터 <- keyword_DTM(data = re_DT_컴퓨터, keyword = '컴퓨터')
# 샘플데이터로 실행 불가 (지자체 데이터로 변경 후 실행 가능)
keyword_aruls(dtm = dtm_컴퓨터, keyword = '컴퓨터', supp = 0.3, conf = 0.15)
find_topic_N(dtm = dtm_컴퓨터)
k <- 3
keyword_topic(data = re_DT_컴퓨터, dtm = dtm_컴퓨터, k = k, keyword = '컴퓨터')

# 2) 수업
re_DT_수업 <- keyword_DT(keyword = '수업')
dtm_수업 <- keyword_DTM(data = re_DT_수업, keyword = '수업')
# 샘플데이터로 실행 불가 (지자체 데이터로 변경 후 실행 가능)
keyword_aruls(dtm = dtm_수업, keyword = '수업', supp = 0.3, conf = 0.15)
find_topic_N(dtm = dtm_수업)
k <- 2
keyword_topic(data = re_DT_수업, dtm = dtm_수업, k = k, keyword = '수업')

#####################################################################################################
## Tableau Output
#####################################################################################################
# 샘플데이터로 실행 불가 (지자체 데이터로 변경 후 실행 가능)
source('C:/01.Project/01.분석참조모델/Rscript/바란다/09. Tableau.R', encoding = "UTF-8")
#####################################################################################################

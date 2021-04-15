covid_data <- read.table("Data_COVID_OWID_per_capita.csv", header = TRUE, sep = ",", 
                         stringsAsFactors = FALSE)

my.data <- data.frame(scale(covid_data[,-1])) #Data without countries
data1 <- na.omit(my.data) #Data where every row with NaN's are removed. 
set.seed(1)
#Randomly take 13 observations out of the 27 total observations
train <- sample(27, 17)

model <- lm(TotalDeaths ~ . -TotalCases, data = data1, subset = train)
mean((data1$TotalDeaths - predict(model, data1))[-train]^2)










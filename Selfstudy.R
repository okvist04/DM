covid_data <- read.table("Data_COVID_OWID_per_capita.csv", header = TRUE, sep = ",", 
                         stringsAsFactors = FALSE)

my.data <- data.frame(scale(covid_data[,-1])) #Data without countries
data_noNA <- na.omit(covid_data) #Data where every row with NaN's are removed. 
boxplot(data_noNA)

data.pca <- prcomp(data_noNA[,c(1:28,30,45)], center = TRUE, scale. = TRUE)

summary(data.pca)
str(data.pca)

library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)

ggbiplot::ggbiplot(data.pca, labels = rownames(data_noNA), xlim = c(-10,10), ylim = c(-4,4))


set.seed(1)
#Randomly take 13 observations out of the 27 total observations
train <- sample(27, 17)

model <- lm(TotalDeaths ~ . -TotalCases, data = data1, subset = train)
mean((data1$TotalDeaths - predict(model, data1))[-train]^2)
summary(model)



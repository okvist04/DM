covid_data <- read.table("Data_COVID_OWID_per_capita.csv", header = TRUE, sep = ",", 
                         stringsAsFactors = FALSE)

#Using Hierarchical Clustering
hc.complete <- hclust(dist(covid_data), method = "complete")
plot(hc.complete)

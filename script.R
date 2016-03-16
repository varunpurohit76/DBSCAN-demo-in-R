# creating data
set.seed(665544)
n <- 600
data <- cbind(runif(10, 0, 10)+rnorm(n, sd=0.2), runif(10, 0, 10)+rnorm(n, sd=0.2))
                                                                     
frame <- data.frame(matrix(nrow = 600))
frame$x <- data[,1]
frame$y <- data[,2]

library(dbscan)
scan <- dbscan(data, eps=0.25, minPts = 3)

frame$cluster <- scan$cluster
# adding cluster number to the data

library(plotly)
plot_ly(frame, 
        x = x, 
        y = y,
        mode = "markers", 
        symbol = cluster)
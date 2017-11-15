#read data 
data = read.csv(file="merged_data_validation.csv",
                header=TRUE,
                sep=",")
#remove invalid structure
data = data[data$valid.sturcture != "N", ]

#new data frame with p.lys
data_plys = data[, c("ID", "A1", "A2", "A3", "A4", "A5", "A6", "p.lys")]
data_plys = na.omit(data_plys)
rownames(data_plys) = data_plys$ID
#data_plys = data_plys[data_plys$p.lys > 5, ]
#print (data_plys)
#print (nrow(data_plys))
set.seed(1979)
data_random = data_plys[sample(nrow(data_plys)), ]
#print (data_random)
#print (nrow(data_random))
data_train = data_random[1 : (nrow(data_random) * 0.8), ]
data_test = data_random[(nrow(data_random) * 0.8 + 1) : nrow(data_random), ]
write.csv(data_train, file="train.csv")
write.csv(data_test, file="test.csv")
library(ggplot2)
library(ggrepel)


train = read.csv(file="train.csv",
                 header=TRUE,
                 sep=",")

#print (train)
frmla = as.formula(paste("p.lys", 
                         "A1 + A2 + A3 + A4 + A5 + A6",
                         sep = " ~ "))

lm_model = lm(frmla, data=train)
train$predict = predict(lm_model, train[, colnames(train)[3:8]])
print (summary(lm_model))
print (cor(train$p.lys, train$predict))
#print (train[, c("p.lys", "predict")])

p1 = ggplot(train, aes(p.lys, predict)) +
  geom_point(shape=1, size=6) +
  geom_smooth(method="lm") +
  theme_bw() +
  theme(axis.line = element_line(colour = "black"),
        axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) 

print (p1)


# #train on subset
# train_01 = train[train$p.lys < 5, ]
# train_02 = train[train$p.lys >= 5, ]
# 
# lm_model_01 = lm(frmla, data=train_01)
# train_01$predict = predict(lm_model_01, train_01[, colnames(train)[3:8]])
# print (summary(lm_model_01))
# print (cor(train_01$p.lys, train_01$predict))
# 
# lm_model_02 = lm(frmla, data=train_02)
# train_02$predict = predict(lm_model_02, train_02[, colnames(train)[3:8]])
# print (summary(lm_model_02))
# print (cor(train_02$p.lys, train_02$predict))
# 
# 
# 
# p2 = ggplot(train_01, aes(p.lys, predict)) +
#   geom_point(shape=1, size=6) +
#   geom_smooth(method="lm") +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#         axis.text=element_text(size=14),
#         axis.title=element_text(size=14),
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(),
#         panel.background = element_blank())
# 
# p3 = ggplot(train_02, aes(p.lys, predict)) +
#   geom_point(shape=1, size=6) +
#   geom_smooth(method="lm") +
#   theme_bw() +
#   theme(axis.line = element_line(colour = "black"),
#         axis.text=element_text(size=14),
#         axis.title=element_text(size=14),
#         panel.grid.major = element_blank(),
#         panel.grid.minor = element_blank(),
#         panel.border = element_blank(),
#         panel.background = element_blank())
# 
# 
# print (p2)
# print (p3)
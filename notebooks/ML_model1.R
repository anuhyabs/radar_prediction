data <- read.csv("~/Desktop/finaldata.csv")

data <- as.data.frame(data)

head(data)

pairs(data[6:10])


data$density <- scale(data$density, center=TRUE, scale=TRUE)
data$height <- scale(data$height,center=TRUE,scale=TRUE)
data$temperature <- scale(data$temperature,center=TRUE,scale=TRUE)
data$grain_size <- scale(data$grain_size,center=TRUE,scale=TRUE)

data <- na.omit(data)

library(dplyr)
library(caret)

set.seed(1)
# Validation Set appraoch
training.samples <- data$VV %>%
  createDataPartition(p = 0.8, list = FALSE)     #creating 80-20 train-test split (because of less number of data-points)
train.data <- data[training.samples, ]
test.data <- data[-training.samples, ]


#Linear regression for HH
lm.fit <- lm(HH ~ height + grain_size + density + temperature , data= train.data)
summary(lm.fit)

HH_lm.fit <- predict(lm.fit, test.data)
HH_lm.fit
vs.error <- sqrt(mean((test.data$HH - predict(lm.fit, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$HH - predict(lm.fit, train.data))^2))

vs.error
vs.error.1

#Linear regression for HV
lm.fit <- lm(HH ~ height + grain_size + density + temperature , data= train.data)
summary(lm.fit)

HV_lm.fit <- predict(lm.fit, test.data)
vs.error <- sqrt(mean((test.data$HV - predict(lm.fit, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$HV - predict(lm.fit, train.data))^2))

vs.error
vs.error.1

#Linear regression for VV
lm.fit <- lm(VV ~ height + grain_size + density + temperature , data= train.data)
summary(lm.fit)

VV_lm.fit <- predict(lm.fit, test.data)
vs.error <- sqrt(mean((test.data$VV - predict(lm.fit, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$VV - predict(lm.fit, train.data))^2))

vs.error
vs.error.1

#Linear regression for VH
lm.fit <- lm(VH ~ height + grain_size + density + temperature , data= train.data)
summary(lm.fit)

VH_lm.fit <- predict(lm.fit, test.data)
vs.error <- sqrt(mean((test.data$VH - predict(lm.fit, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$VH - predict(lm.fit, train.data))^2))

vs.error
vs.error.1

pairs(data[2:6])

library(rpart)

mytree <- rpart(
  VV ~ height + grain_size + density + temperature, 
  data = train.data, 
  method = "anova"
)

mytree

library(rattle)
library(rpart.plot)
library(RColorBrewer)

# plot mytree
fancyRpartPlot(mytree, caption = NULL)

VV_tree <- predict(mytree, test.data)
vs.error <- sqrt(mean((test.data$VV - predict(mytree, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$VV - predict(mytree, train.data))^2))

vs.error
vs.error.1

mytree <- rpart(
  HH ~ height + grain_size + density + temperature, 
  data = train.data, 
  method = "anova"
)

mytree


# plot mytree
fancyRpartPlot(mytree, caption = NULL)

HH_tree <- predict(mytree, test.data)
vs.error <- sqrt(mean((test.data$HH - predict(mytree, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$HH - predict(mytree, train.data))^2))

vs.error
vs.error.1

mytree <- rpart(
  HV ~ height + grain_size + density + temperature, 
  data = train.data, 
  method = "anova"
)

mytree


# plot mytree
fancyRpartPlot(mytree, caption = NULL)

HV_tree <- predict(mytree, test.data)
vs.error <- sqrt(mean((test.data$HV - predict(mytree, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$HV - predict(mytree, train.data))^2))

vs.error
vs.error.1


mytree <- rpart(
  VH ~ height + grain_size + density + temperature, 
  data = train.data, 
  method = "anova"
)

mytree


# plot mytree
fancyRpartPlot(mytree, caption = NULL)

VH_tree <- predict(mytree, test.data)
vs.error <- sqrt(mean((test.data$VH - predict(mytree, test.data))^2))
vs.error.1 <- sqrt(mean((train.data$VH - predict(mytree, train.data))^2))

vs.error
vs.error.1

library(randomForest)
rf <- randomForest(HH ~ grain_size + density + temperature + height, data = train.data,
                   ntree = 150,
                   mtry = 5)

rf.pred <- predict(rf, newdata=test.data)
plot(rf.pred, test.data$y)
abline(0,1)
sqrt(mean((rf.pred- test.data$HH)^2))


varImpPlot(rf,
           sort = T,
           n.var = 4,
           main = "Variable Importance")
importance(rf)

library(randomForest)
rf <- randomForest(VV ~ grain_size + density + temperature + height, data = train.data,
                   ntree = 150,
                   mtry = 5)

rf.pred <- predict(rf, newdata=test.data)
plot(rf.pred, test.data$y)
abline(0,1)
sqrt(mean((rf.pred- test.data$VV)^2))


varImpPlot(rf,
           sort = T,
           n.var = 4,
           main = "Variable Importance")
importance(rf)

rf <- randomForest(VH ~ grain_size + density + temperature + height, data = train.data,
                   ntree = 150,
                   mtry = 5)

rf.pred <- predict(rf, newdata=test.data)
plot(rf.pred, test.data$y)
abline(0,1)
sqrt(mean((rf.pred- test.data$VH)^2))

varImpPlot(rf,
           sort = T,
           n.var = 4,
           main = "Variable Importance")
importance(rf)

rf <- randomForest(HV ~ grain_size + density + temperature + height, data = train.data,
                   ntree = 150,
                   mtry = 5)

rf.pred <- predict(rf, newdata=test.data)
plot(rf.pred, test.data$y)
abline(0,1)
sqrt(mean((rf.pred- test.data$HV)^2))

varImpPlot(rf,
           sort = T,
           n.var = 4,
           main = "Variable Importance")
importance(rf)

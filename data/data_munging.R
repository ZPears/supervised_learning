# Clean up all the data

setwd('/Users/zpears/georgia_tech/ml/projects/supervised_learning/data')

d <- read.csv("default_data.csv")
d <- d[, 0:24]
d["SEX"] <- d["SEX"] - 1
d["EDU_GRAD_SCHOOL"] <- as.numeric(d["EDUCATION"] == 1)
d["EDU_UNIVERSITY"] <- as.numeric(d["EDUCATION"] == 2)
d["EDU_HIGH_SCHOOL"] <- as.numeric(d["EDUCATION"] == 3)
d["EDU_OTHER"] <- as.numeric(d["EDUCATION"] == 4)
d["MARITAL_MARRIED"] <- as.numeric(d["MARRIAGE"] == 1)
d["MARITAL_SINGLE"] <- as.numeric(d["MARRIAGE"] == 2)
d["MARITAL_OTHER"] <- as.numeric(d["MARRIAGE"] == 3)
d["default payment next month"] <- d["default"]

d <- d[, c("LIMIT_BAL", "SEX", "EDU_GRAD_SCHOOL", "EDU_UNIVERSITY", "EDU_HIGH_SCHOOL", "EDU_OTHER",
           "MARITAL_MARRIED", "MARITAL_SINGLE", "MARITAL_OTHER", "AGE", "PAY_0", "PAY_2",
           "PAY_3", "PAY_4", "PAY_5", "PAY_6", "BILL_AMT1", "BILL_AMT2", "BILL_AMT3", "BILL_AMT4",
           "BILL_AMT5", "BILL_AMT6", "PAY_AMT1", "PAY_AMT2", "PAY_AMT3", "PAY_AMT4", "PAY_AMT5",
           "PAY_AMT6", "default payment next month")]

write.csv(d, "categorical_default_data.csv", row.names=FALSE)

d["DELTA_1"] <- d$BILL_AMT1 - d$PAY_AMT1
d["DELTA_2"] <- d$BILL_AMT2 - d$PAY_AMT2
d["DELTA_3"] <- d$BILL_AMT3 - d$PAY_AMT3
d["DELTA_4"] <- d$BILL_AMT4 - d$PAY_AMT4
d["DELTA_5"] <- d$BILL_AMT5 - d$PAY_AMT5
d["DELTA_6"] <- d$BILL_AMT6 - d$PAY_AMT6

d <- d[, c("LIMIT_BAL", "SEX", "EDU_GRAD_SCHOOL", "EDU_UNIVERSITY", "EDU_HIGH_SCHOOL", "EDU_OTHER",
           "MARITAL_MARRIED", "MARITAL_SINGLE", "MARITAL_OTHER", "AGE", "PAY_0", "PAY_2",
           "PAY_3", "PAY_4", "PAY_5", "PAY_6", "DELTA_1", "DELTA_2", "DELTA_3", "DELTA_4",
           "DELTA_5", "DELTA_6", "default payment next month")]

write.csv(d, "merged_categorical_default_data.csv", row.names=FALSE)

aba <- read.csv('abalone.csv')
aba$male <- as.numeric(aba$sex == "M")
aba$female <- as.numeric(aba$sex == "F")
aba$infant <- as.numeric(aba$sex == "I")
aba$less_than_ten_rings <- as.numeric(aba$rings < 10)

aba <- aba[, c("male", "female", "infant", "length", "diameter", "height", "whole_weight",
               "shucked_weight", "viscera_weight", "shell_weight", "less_than_ten_rings")]

write.csv(aba, "cleaned_abalone_data.csv", row.names=FALSE)

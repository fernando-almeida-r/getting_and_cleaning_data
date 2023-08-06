# Course 3 - Week 4 Project

setwd("D:/Projetos/R/Coursera/datascience/Cleaning_data/week4")

# Install and Load required packages
install.packages("tidyverse")
install.packages("stringr")
install.packages("plyr")
install.packages("dplyr")
install.packages("rlang")

library(tidyverse)
library(stringr)
library(plyr)
library(dplyr)
library(rlang)

# As data was previously downloaded, variables were created
#Features - Each row identifies features and their id
features = read.table("./features.txt", header = FALSE, sep = " ")
features_names <- as.character(features$V2)
#mean_std <- select(features_names, )

# Test
# Test labels - Each row identifies who trained
subject_test_test <- read.table("./test/y_test.txt", header = FALSE, sep = "\t")
subject_test_test <- rename(subject_test_test, c("V1" = "subject"))

# Test data
# Data was previously downloaded - White spaces were substituted by ";" in notepad
test_set <- read.table("./test/X_test.txt", header = FALSE, sep = ";")
test_set <- test_set[,-1]

test_set <- set_names(test_set, nm = features_names)
test_set <- mutate(test_set, subject = subject_test_test, data = rep("test", nrow(test_set)))

# Train
# Train labels - Each row identifies who trained
subject_test_train <- read.table("./train/y_train.txt", header = FALSE, sep = "\t")
subject_test_train <- rename(subject_test_train, c("V1" = "subject"))

# Test data
# Data was previously downloaded - White spaces were substituted by ";" in notepad
train_set <- read.table("./train/X_train.txt", header = FALSE, sep = ";")
train_set <- train_set[,-1]

train_set <- set_names(train_set, nm = features_names)
train_set <- mutate(train_set, subject = subject_test_train, data = rep("train", nrow(train_set)))

# merging datasets
df <- bind_rows(test_set, train_set)

# Extract columns related to mean and standard deviation
df_filtered <- df[,grep(pattern =  'mean|std|data|subj', 
                        colnames(df))] 

# Creating tidy data set with average of all variable for each user
tidy_df <- df_filtered %>% group_by(subject, data) %>% summarise_all(list(mean = mean))
write.table(tidy_df, file = "./tidy_df.txt", row.name = FALSE)
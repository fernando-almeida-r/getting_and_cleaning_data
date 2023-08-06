# Getting and Cleaning Data - Week 4

This code is designed to answer the last questions of the course Getting and Cleaning Data.

## Packages
At first 5 different packages were uploaded in order to provide the functions used to get and clean data.
"tidyverse", "stringr", "plyr", "plyr", "rlang"

## Upload data
As data was previously downloaded at working directory, it was possible to edit them.
1. All double spaces were substituted by single space
2. All single spaces were substituted by ";"

First, features names were uploaded and converted as character. 

Subject dataset, for tests and training, were uploaded. AS their first column seemed to be empty, they were deleted. Columns names were updated with features names, and an extra column were added, in order to identified if data comes from test or training.

## Merging data
Both datasets were merged with bind_rows function.

## Extract specific data
In order to extract meand and standard deviation data, grep was used to identify all columns that match with the words "mean", "std", "data" and "subj".

## Creating tidy dataset
With grouped data by subject and data, summmarise_all function calculated the mean of all variabes.

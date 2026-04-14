# STA220 Week 3 R Code

#Reading in a data file

# Make sure the data file is saved in your "Working Directory". 
# That is the folder in which R is working in.
# Check your current working directory using getwd()
getwd()

# Change your working directory either by clicking on "Session" then "Set Working Directory", 
# or running the setwd() function
setwd("/Users/jessieyeung/Documents/") #Change this line to be where your files are saved

# Data files are usually saved as .txt or .csv files.
# Use read.csv to read in the files
pizza_data <- read.csv("Pizza.csv")

# Most people use the $ to access variables
# This takes the column, and returns a vector
pizza_data$Sales
pizza_data$Price 

# Now we can use all the functions that apply to vectors

min(pizza_data$Sales)

mean(pizza_data$Price)

IQR(pizza_data$Price)

# head() allows us to take a peak at the first few rows of the data
head(pizza_data)

# tail() allows us to take a peak at the last few rows of the data
tail(pizza_data)

# dim() gives the dimensions of the data
dim(pizza_data)

# CREATING A NEW VARIABLE

# What if we want to create a new variable based on current variables? 

# The line below will create a vector based on the Price column
pizza_data$Price > 4

# Let's turn this vector into a new variable in the data
pizza_data$is_expensive <- pizza_data$Price > 4

# If we don't want TRUE/FALSE, we can make them 1's and 0's
pizza_data$is_expensive2 <- as.numeric(pizza_data$Price > 4)

# FILTERING THROUGH THE OBSERVATIONS

# What if we only want to specific observations? 
# For example, what if we only want observations (rows) where the Sales is more than 60,000
high_sales_pizza <- pizza_data[pizza_data$Sales > 60000 , ]






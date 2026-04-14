# STA220 Week 5 R Code

# Creating Plots in R

# Follow the code created last week to read in the life expectancy dataset posted on Quercus
country_data <- read.csv("LifeExp.csv")



# DATA TYPES: Numeric vs. Character
# Columns in the data can be either numeric or character types
str(country_data)



# FILTER THROUGH THE DATA
# Suppose you were only interested in some observations in the data, and not all of them
# You can filter through the data so that you only see observations where a condition is met
# Format: dataset_name[dataset_name$variable == value,]

# Create a new dataset called amer_countries that only contains countries in the Americas
amer_countries <- country_data[country_data$Region == 'Amer',]

# Create a new dataset called high_life_exp that only contains countries where life expectancy is greater than 80
high_life_exp <- country_data[country_data$LifeExp > 80,]

# Create a new dataset only contains countries in the Americas AND have life expectancy > 80
high_life_amer <- country_data[country_data$LifeExp > 80 & country_data$Region == 'Amer',]

# Create a new dataset only contains countries either in the Americas OR have life expectancy > 80
high_life_amer <- country_data[country_data$LifeExp > 80 | country_data$Region == 'Amer',]

# Create a histogram of the GDPs of only the countries with life expectancies over 80
hist(high_life_exp$GDP)


# PLOTTING THE RELATIONSHIP BETWEEN QUANTITATIVE AND CATEGORICAL
# One option is a side-by-side boxplot. One boxplot for each category. 
# Format: boxplot(dataset_name$quant_variable ~ dataset_name$categorical_variable)

boxplot(country_data$LifeExp ~ country_data$Region)

# You can customize just like we saw before.
boxplot(country_data$LifeExp ~ country_data$Region,
        names=c('Americas','E.Asia&Pc','Eur&C.As','M.E&N.Afr','S.Asia','S-S.Africa'),
        col=rainbow(6),
        ylab="Life Expectancy",
        xlab="Regions", 
        main="title here")



# PLOTTING THE RELATIONSHIP BETWEEN TWO QUANTITATIVE VARIABLES
# One option is a scatterplot 
# Format: plot(dataset_name$y_variable ~ dataset_name$x_variable)

plot(country_data$LifeExp ~ country_data$HIV)

plot(country_data$LifeExp ~ country_data$HIV, col="blue")




# PLOTTING THE RELATIONSHIP BETWEEN TWO CATEGORICAL VARIABLES
# Let's read in a new dataset for this example
bmi_data <- read.csv("bmi.csv")

# Here we want to plot the relationship between two categorical variables: Sex and BMI category
# We can do this using a bar plot

# First we use the table() function to get some counts -- similar to what we did before
bmi_sex_table <- table(bmi_data$BMIcat, bmi_data$Sex)

# Now let's create some side-by-side barplots

barplot(bmi_sex_table,
        beside=TRUE,
        col=c('red','blue','green','violet'),
        ylab='Frequency',
        xlab='Sex')

# Add a legend
legend('topleft', 
       legend=c('normal', 'obese', 'overweight', 'underweight'), 
       fill=c('red','blue','green','violet'), 
       cex = 0.5)

# For stacked barplot, set beside=FALSE
barplot(bmi_sex_table,
        beside=FALSE,
        col=c('red','blue','green','violet'),
        ylab='Frequency',
        xlab='Sex')

legend('topleft', 
       legend=c('normal', 'obese', 'overweight', 'underweight'), 
       fill=c('red','blue','green','violet'), 
       cex = 0.5)

letters
pi
month.name
month.abb
x=5
typeof(x)
x= 5L
typeof(x)
is.character("12-12-2020")
x <- c(1, 5.4, TRUE, "hello")
typeof(x)
as.numeric(2)
x= 5L
typeof(x)
is.character(as.Date("12-12-2020"))
##Write a program to enter name and age using the keyboard and print greeting,
##name, and next year’s age.

name <- "Pradeep"
cat(readline("enter a name: "))
age <- "37"

Greetings <- cat("Hi,", name, "is", age, "years old")

==============================
name <- "Hotspot"

# Prompt the user to enter their age
cat("Enter your age: ")
age <- as.integer(readline())

# Calculate next year's age
next_year_age <- age + 1

# Print greeting, name, and next year's age
cat("Hello,", name, "! You will be", next_year_age, "years old next year.\n")
==============================

#ACTIVITY 1
school <- readline("Enter a school: ")
course <- readline("Enter a course: ")
year<- readline("Enter year: ")

school <- "UoB"
course <- "DAT"
year <- "October, 2023"

Speech <- cat("I am a student of", school, ". I am currently studying", 
              course, ", I joined in", year, ".")
==============================

#ACTIVITY 2

Mark1 <- 50
Mark2 <- 10
Mark3 <- 60

Total_Mark <- Mark1 + Mark2 + mark3
Ave_Mark <- Total_Mark / 3

print(Total_Mark)
print(Ave_Mark)
==============================
  
#ACTIVITY 3

  Enter the mark using the keyboard and print the grade base on the following conditions:
  If  number > 0 then number is positive
If number < 0 then number is negative
If number =0 then number is zero

number = 5
if (number > 0)
{
  print("number is greater than zero")
}else if (number < 0)
{
  print("number is less than zero")
} else
        {
print("number is zero")
        }
===========================
#Activity 4
  
Enter the mark using the keyboard and print the grade base on the following conditions:
If  100 >=  Marks >=70 then grade= Distinction
If 70> marks >= 60 then grade= Merit
If 60> marks >= 50 then grade= Pass
If  50> marks >= 0 the grade= Fail


Mark <- 61
if (Mark <= 100 & Mark >= 70)
{
  print("Distinction")
}else if (Mark < 70 & Mark >= 60)
{
  print("Merit")
} else if (Mark < 60 & Mark >= 50)
{
  print("Pass")
}else
{
  print("Fail")
}
===========================
#LOOP
  
i = 5
while (i <= 30)
{
  print(i)
  i = i + 2
}
===========================
  
i <- 10
while (i <= 30)
{
  print(i)
  i <- i + 2
  if (i == 20)
  {
    next
  }
  print(i)
}
===========================
#Break
i <- 1
while (i < 10){
  i <- i + 1
  if (i == 5){
    break
  }
  print(i)
}
===========================
#Next

  i <- 1
while (i < 10){
  i <- i + 1
  if (i == 5){
    next
  }
  print(i)
}
===========================
  for (i in 1:10) {
    print(i)
  }
==
==

x <- 1:5
for (val in x){
  if (val == 3){
    next
  }
    print(x)
}
========

x <- 1:5
for(val in x){
  if(val == 3){
    break
  }
  print(val)
}
===========================
#ACTIVITY 5

Print 1 to 10 numbers using the While loop

i = 1
while (i <= 10)
{
  print(i)
  i <- i + 1
}
============================
#Activity 6

Write a for loop that iterates over the numbers 1 to 7 and prints the cube of 
each number using print().

i <- 1:7
for (i in 1:7)
{
  i <- i * i * i #print(i^3)
  print(i)
}
============================
#Activity 7
  
Print your name 10 times using the Repeat loop.

counter <- 0
repeat{
  counter <- counter + 1
  print("The boy is good")
  if(counter ==15){
    break
  }
}
===========================
#ACTIVITY 8

Write a while loop that prints out standard random normal numbers (use rnorm())
but stops (breaks) if you get a number bigger than 1.

while(TRUE) {
  # Generate a random normal number
  random_number <- rnorm(1)
  
  # Print the generated number
  print(random_number)
  
  # Check if the generated number is bigger than 1
  if (random_number > 1) {
    # If the condition is met, break the loop
    break
  }
}
========================
  
student_num <- c(1,2,3,4)
name <- c("Aam”, “Andrew”, “Reena”, “Teena")
total <- 4

Student_list = list(student_num, name, total)
print(Student_list)


student_ages = list(ages = c(23,48,54,30))
student_details= c(Student_list , student_ages)
print(student_details)
======================
  x= c('a','b','c','d','e')
for (i in x) {
  print(i)
}
sort(i)
=======
  for(i in 1:3) {
    for (j in 1:3) {
      print(i,j)
    }
  }
==========
  vec1 <- c(1,2,3)
vec2  <- c("R","Scilab","Java")
vec3 <- c("For prototyping", "For prototyping","For Scaleup")
df <- data.frame(vec1,vec2,vec3)
print(df)
=====================
#VECTOR
  
v1 <- c(1, 4,10)
v2 <- c(0, 7, 5)
#add
v <- v1 + v2
print(v)
================
  #substract

  v1 <- c(1, 4,10, 11, 3)
v2 <- c(0, 7, 5)
v <- v1 - v2
print(v)
sort.result <- sort(v)
print(sort.result)
=======================
#ACTIVITY 10

v <- c(1, 4,10, 11, 3)
sum_v <- sum(v)
print(sum_v)

mean_v <- mean(v)
print(mean_v)
======================
list1 <- list(1:5)
print(list1)
v1 <- unlist(list1)
print(v1)
==================
  ## Create a vector as input.
  data <- c("East","West","East","North","North","East","West","West","West","East","North")

print(data)
print(is.factor(data))
factor_data <- factor(data)

print(factor_data)
levels(factor_data)
nlevels(factor_data)
print(is.factor(factor_data))
data <- c("East","West","East","North","North","East","West",
          "West","West","East","North")
# Create the factors
factor_data <- factor(data)
print(factor_data)



# Apply the factor function with required order of the level.
new_order_data <- factor(factor_data,levels = c("East","West","North"))
print(new_order_data)

#Generating factor levels
#By gl(n,k,labels)function
#n is a integer giving the number of levels.
#k is a integer giving the number of replications.
#labels is a vector of labels for the resulting factor levels.
v <- gl(3, 4, labels = c("Tampa", "Seattle","Boston"))
print(v)


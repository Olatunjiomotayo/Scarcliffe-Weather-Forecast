# FUNCTIONS, DATATIME

total <- function(x = 5, y = 10){
  x + y
}
total(50)
===
total <- function(x = 5, y = 10){
    x + y
  }
total(50,100)
===
result <- function(x){
  n = x >= 80
  print(x[n])
}
x <- c(80, 90, 10, 34)
result(x)
===
data <- mtcars
data
View(data)

mpg_category <- function(mpg){
  if(mpg > 30){
    return("High")
  }else if(mpg > 20){
    return("Medium")
  }else{
    return("Low")
  }
}
mpg_category(56)

lapply(data$mpg, mpg_category)
sapply(data$mpg, mpg_category)
===========================================
#WORKING WITH DATE AND TIME
  
df <- read.csv("C:\\Users\\user\\OneDrive\\Documents\\DAT7006\\dates_example.csv")
df
View(df)
str(df)
first_col <- as.Date(df$month_day_year, format = "%m/%d/%y")
first_col
typeof(first_col)
class(first_col)

third_col <- as.POSIXct(df$date_time, format = "%a %b %d %H:%M:%S %Y")
third_col
========================
  
x <- as.Date("1970-01-01”)
x

unclass(x)
unclass(as.date(“1970-01-01”))
x= sys.time()
p= as.POSIXlt(x)
names(unclass(p))
p$sec
unclass(x)
x$sec
p=POSIXlt(x)
p$sec

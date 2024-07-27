#The rnorm(n, mean, sd) function is used to generate n random values from a normal distribution with a specific mean and standard deviation. 
#The runif(n, min, max) function is used to generate n random values from a uniform distribution with a specific minimum and maximum value

x<- rnorm(10, 5,3)
x

y<- runif(10, 20, 50)
y

#################################################

#Working on a randomly generated data
mydata <- runif(n=50, min=10, max=45)
mydata
str(mydata)

#convert it into time series
myts <- ts(data=mydata, start=1956, frequency = 4)
myts
class(myts)

#ts (univariate) 
#mts(multivariate), xts(irregularly- some observations for holidays are missing)
#ts (time series object), start=, frequency = 


#shows the time series
time(myts)  

#Draw plot
par(mar = c(1, 1, 1, 1))
par(oma=c(1,1,1,1))
plot(myts)


#data starts at a particular year 3rd quarter

#start = c(1956, 3), frequency= 4

myts <- ts(data=mydata, start=c(1956,3), frequency = 4)
myts

#Hourly measurement with daily patterns, starts at 8am on the first day
#start= c(1,8), frequency = 24

#monthly measurements: frequency=12
#weekly measurements: frequency =52

#nottem: Average Monthly Temperatures at Nottingham, 1920-1939

nottem

#Plotting time series
plot(nottem)

#seasonal decomposition
plot(decompose(nottem))

install.packages('forecast')
library(forecast)
#forecast using arima model
plot(forecast(auto.arima(nottem), h= 5)) #for next 5 years

install.packages('ggplot2')
library(ggplot2)
autoplot(nottem)
ggseasonplot(nottem)
ggmonthplot(nottem)

#irregular time series
#import sensor dataset
#aggregation

#zoo package: It is particularly aimed at irregular time series of numeric vectors/matrices and factors
install.packages('zoo')
library(zoo)

library(tidyverse)
irregular_sensor

# Method -1 Remove the time component
irreg.split <- separate(irregular_sensor, 
                        col='V1', 
                        into=c('date', 'time'), 
                        sep=8, remove = T)

irreg.split

#Read: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/strptime

sensor.date <- strptime(irreg.split$date, '%m/%d/%y')
sensor.date

#Creating a new dataframe for analysis
irregts.df <- data.frame(date = as.Date(sensor.date), measurements= irreg.split$V2)
irregts.df

#to aggregate, convert data to zoo object
#Step 1: Create zoo object
irreg.dates <- zoo(irregts.df$measurements, order.by = irregts.df$date)
irreg.dates
#Step 2: regularizing with aggregate
ag.irregtime <- aggregate(irreg.dates, as.Date, mean)
ag.irregtime
length(ag.irregtime)

#Method 2: 
sensor.data1 <- strptime(irregular_sensor$V1, '%m/%d/%y %I:%M %p') 
#I:M for 24 hr minutes:seconds, p for am/pm

sensor.data1

irreg.dates1 <- zoo(irregular_sensor$V2, order.by = sensor.data1) 
irreg.dates1


ag.irregtime1 <- aggregate(irreg.dates1, as.Date, mean)
ag.irregtime1

plot(ag.irregtime1)
#myts_sensor <- ts(ag.irregtime1)
#plot(myts_sensor)

#import the ts_NA and outlier dataset
mydata<- read.csv('C:\\Users\\anchal\\Downloads\\ts_NAandOutliers.csv')
View(mydata)
myts<- ts(mydata$mydata)
myts

summary(myts)
str(myts)
plot(myts)


#detect outliers
library(forecast)
myts1 <- tsoutliers(myts)
myts1

#removing missing values
library(zoo)

#missing data imputation
#na.locf() - last observation carried forward

myts.Nalocf <- na.locf(myts)
myts.Nalocf

#myts.fil <- na.fill(myts, 35)

#na.trim: to get rid of missing values at the beginning/end of the dataset
#use na.interp in forecast package: does interpolation
myts.NAinterp <- na.interp(myts)

#Cleaning NA and handling outliers
myts_clean <- tsclean(myts)
myts_clean
plot(myts_clean)
summary(myts_clean)

#################################
#Simple models like Mean method, Naive and Drift are not used if there is seasonality
#instead use ARIMA
set.seed(50)
myts <- ts(rnorm(200), start=1818)
plot(myts) 

mean_method <- meanf(myts, h=30) #forecast 30 values
naive_method <- naive(myts, h=30)
drift_method <- rwf(myts, h=30, drift= T)

plot(mean_method, plot.conf=F, main=" ")
lines(naive_method$mean, col=123, lwd=2)
lines(drift_method$mean, col=22, lwd=2)
legend('topleft', lty=1, 
       col=c(4,123,22),
       legend = c('Mean method',"Naive method", 'Drift method'))

#Splitting data into test and train set

myts_train <- window(myts, start=1818, end=1988)
plot(myts_train)

mean_method <- meanf(myts_train, h=30) #forecast 30 values
naive_method <- naive(myts_train, h=30)
drift_method <- rwf(myts_train, h=30, drift= T)

myts_test <- window(myts, start=1988)

#forecast accuracy - MAE,RMSE,MAPE, MSE 
accuracy(mean_method, myts_test)
accuracy(naive_method, myts_test)
accuracy(drift_method, myts_test)

#Residuals/error must be normally distributed
length(myts_train)
plot(mean_method$residuals)
mean(mean_method$residuals[2:171])
hist(mean_method$residuals)
shapiro.test(mean_method$residuals)
#value < 0.05, so reject null hypo and so distribution is not normally distr

#autocorrelation
acf(mean_method$residuals[2:171])

####################################################################

#Stationarity - mean and variance is constant
#install.packages('urca')
x<- rnorm(1000)
library(tseries)
#Augmented Dicker Fuller test
adf.test(x)
#p-value <0.05 , reject null hypothesis, data is stationary

#Another example for stationarity
nottem
plot(nottem)
plot(decompose(nottem))
adf.test(nottem)

#Taking non-stationary example
#convert x dataset to non-stationary

y<- diffinv(x)
adf.test(y)
ndiffs(y)

y1<- diff(y)
adf.test(y1)
#p-value >0.05, accept null hypo, data is non-stationary

plot(y)

###########################################33
#Auto-correlation
lynx
library(lmtest)
dwtest(lynx[-114]~ lynx[-1]) 
#shows autocorrelation

#Auto-correlation: correlation coefficient between different data points (lags) in a time-series
#used for moving average (MA)
##Moving average (MA): relates to current value of time series to past white noise/error terms

acf(lynx, lag.max=20) 

#Partial correlation: correlation coefficient adjusted for all shorter lags in a time-series
#used for Autoregression (AR)
pacf(lynx, lag.max = 20) 


#Autocorrelation- represents overall correlation structure of the time-series
#Autocorrelation measures the linear relationship between an observation and its previous observations at different lags
#Partial autocrrelation- shows direct relationships between observations at specific lags
#Partial Autocorrelation measures the direct linear relationship between an observation and its previous observations at a specific lag, 
#excluding the contributions from intermediate lags.
#video for reference: https://www.youtube.com/watch?v=DeORzP0go5I&t=20s
#video for reference:https://www.youtube.com/watch?v=wfDstwTdoxU from 11:36- 19:15, 22:54 onwards
#https://www.youtube.com/watch?v=ZE_WGBe0_VU



#To dsiplay acf and pacf on a single plot
tsdisplay(lynx, lag.max=20)


#####################################################

#Use the above models if there is no trend and there is a random pattern
#arima model - explain patterns in data based on autoregression 

###################################################

#Seasonal time series
#seasonal decomposition
#additive method: constant trend- amplitude is almost same
#multiplicative method: increasing trend

plot(nottem)
#additive model

frequency(nottem)
length(nottem)

plot(decompose (nottem, type='additive'))

AirPassengers
frequency(AirPassengers)
plot(AirPassengers)


plot(decompose(AirPassengers, type='multiplicative'))
plot(decompose(AirPassengers, type='additive'))

#white noise should be random and there should be no trend

model1<- decompose(AirPassengers, type='additive')
model2<-decompose(AirPassengers, type='multiplicative')


######################################################
#Arima

plot(lynx)
library(forecast)
tsdisplay(lynx)
library(tseries)
adf.test(lynx)
auto.arima(lynx)
auto.arima(lynx, trace=T)
auto.arima(lynx, trace=T, stepwise = F, approximation = F)

######################################################3
#Manual selection

library(tseries)
adf.test(lynx)

library(forecast)
tsdisplay(lynx)
tail(lynx)

#Arima from forecast package
myarima<- Arima(lynx, order = c(2,0,0))
myarima
checkresiduals(myarima)


myarima<- Arima(lynx, order = c(3,0,0))
myarima
checkresiduals(myarima)

myarima<- Arima(lynx, order = c(4,0,0))
myarima
checkresiduals(myarima)

myarima<- Arima(lynx, order = c(5,0,0))
myarima
checkresiduals(myarima)

#so p=4

#forecast
arimaforecast<- forcast(myarima, h=10)
plot(arimaforecast)
arimaforecast$mean
plot(arimaforecast, xlim= c(1930, 1944))


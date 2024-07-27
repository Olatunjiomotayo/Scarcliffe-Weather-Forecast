#SEASONAL ARIMA
#####################################################################
install.packages('fpp2')
library(fpp2)
library(forecast)
data(elecequip)
plot(elecequip)
elecequip
plot(decompose(elecequip))

elecequip_ts <- ts(elecequip, frequency=12, start=c(1996, 1), end = c(2012,3))

elecequip_train <- window(elecequip_ts, end=c(2010,12))
elecequip_test <- window(elecequip_ts, start=c(2011,1)) 

elecequip_sarima = auto.arima(elecequip_train,
                              stepwise=FALSE,
                              approximation=FALSE,
                              seasonal=TRUE, # This will extent to SARIMA
                              allowdrift=FALSE, 
                              # parallel = TRUE,  # speeds up computation, but tracing not available
                              trace=TRUE)

myforecasts <- forecast(elecequip_sarima, h=40) 
autoplot(myforecasts) + autolayer(elecequip_ts) + xlim(2005,2013) 

#https://medium.com/analytics-vidhya/a-complete-introduction-to-time-series-analysis-with-r-sarima-models-ff86d526d1d7
########################################################################3
#Time-series regression models
#The basic concept is that we forecast the time series of interest y
#assuming that it has a linear relationship with other time series  x.
#For example, we might wish to forecast monthly sales y 
#using total advertising spend  x as a predictor. 
#Or we might forecast daily electricity demand  y using temperature  x1 
#and the day of week  x2 as predictors.

#Method:1

#create a time variable
time <- 1:length(elecequip_train)
time
model<- lm(elecequip_train~time)
summary(model)
time_test<- (length(elecequip_train)+1): (length(elecequip_train)+ length(elecequip_test))
time_test

model_forecast<- predict(model, newdata = data.frame(time=time_test))
(model_forecast)
accuracy(model_forecast, elecequip_test)


#Method:2
install.packages('fpp')
library(fpp)

usconsumption
plot(usconsumption)
model<- tslm(consumption ~ income, data=usconsumption)
summary(model)

model_forecast = forecast(model, newdata = data.frame(income=c(-1,1)))
model_forecast
plot(model_forecast, ylab='% change in consumption', xlab='% change in income')

#Method:3
#Forecasting trend
data <- read.csv("C:\\Users\\anchal\\Downloads\\5stocks.csv")
View(data)

data <- data[c('Date','AAPL')]
View(data)
tail(data)
df<- ts(data, frequency = 12, start=c(2001,7), end = c(2017,5))
df

class(df)
str(df)
plot(df)

model<- tslm(df ~ trend) #predictor is trend
model_forecast <- forecast(model, h=60) # 5 YRS (12*5)
plot(model_forecast)

#if you use linear regression on seasonal data then
#model<-tslm(df~season+trend,timeseries dataframe)

#############################################################

#You usually use log transformation is there is large variation in your data
#myts_log <- log(myts)
#you can then use logged dataset for analysis


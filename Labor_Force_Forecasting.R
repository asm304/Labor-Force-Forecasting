library(fredr)
library(forecast)


fredr_set_key('25e01a7269f9d0fdd83a00ee95e51aee')

labor_force_participation_rate <- fredr(
  series_id = "LNU01375379",
  observation_start = as.Date("2010-01-01"),
  observation_end = Sys.Date()
)

labor_ts <- ts(labor_force_participation_rate$value, start = c(2010, 1), frequency = 12)

acf(labor_ts)

labor_decomposed <- decompose(labor_ts, type = "multiplicative")

trend <- labor_decomposed$trend
seasonal <- labor_decomposed$seasonal
remainder <- labor_decomposed$random

plot(labor_decomposed)


print(trend)
print(seasonal)
print(remainder)

hw_model <- HoltWinters(labor_ts, seasonal = "multiplicative")

print(hw_model)

print(hw_model$seasonal)

plot(hw_model)

hw_forecast <- forecast(HoltWinters(labor_ts, seasonal = "multiplicative"), h = 12)

plot(hw_forecast)


stl_labor <- stl(labor_ts, t.window = 13, s.window = "periodic", robust = TRUE)

seasonal_component <- stl_labor$time.series[, "seasonal"]
trend_component <- stl_labor$time.series[, "trend"]
residual_component <- stl_labor$time.series[, "remainder"]

print(seasonal_component)

plot(stl_labor)

stl_forecast <- forecast(stl_labor, method = "rwdrift", h = 12)

plot(stl_forecast)


hw_rmse <- sqrt(mean((labor_ts - hw_forecast$fitted)^2, na.rm = TRUE))

stl_rmse <- sqrt(mean((labor_ts - stl_forecast$fitted)^2, na.rm = TRUE))

print(paste("Holt-Winters In-Sample RMSE:", hw_rmse))
print(paste("STL + RW Drift In-Sample RMSE:", stl_rmse))


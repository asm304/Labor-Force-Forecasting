# Labor-Force-Forecasting
An analysis of labor force participation rates using time series decomposition and forecasting methods (Holt-Winters &amp; STL Decomposition in R).

We apply:

 - Autocorrelation analysis (ACF & PACF)

 - Classical decomposition (Multiplicative model)

 - Holt-Winters exponential smoothing

 - STL decomposition with a random walk forecast

---

## 📊 Data Source

We use FRED API to retrieve the Labor Force Participation Rate (LNU01375379) from 2010 to the present.


---

## 🛠️ Methods Used

ACF & PACF → Identifies trend and seasonality.

Classical Decomposition → Separates trend, seasonal, and residual components.

Holt-Winters Exponential Smoothing → Forecasts using dynamic trend/seasonality.

STL Decomposition + RW Drift → Forecasts using a de-trended seasonal model.



# Labor Force Participation Rate Forecasting Report

## 📌 Introduction
This report presents an analysis of the **Labor Force Participation Rate (65+ with No Disability)** using **time series decomposition and forecasting techniques**. The objective is to explore trends, seasonality, and randomness in the dataset and compare forecasting models to determine the most reliable approach.

---

## 📊 Data Source
- **Dataset**: Labor Force Participation Rate for individuals aged 65+ (Series ID: `LNU01375379`).
- **Source**: FRED (Federal Reserve Economic Data).
- **Timeframe**: 2010 to present.
- **Frequency**: Monthly.

---

## 📈 Step 1: Autocorrelation Analysis
### **ACF Plot**
- The **Autocorrelation Function (ACF)** was plotted to examine dependencies in the time series.
- The plot indicated a **gradual decay**, suggesting a **strong trend** but **no dominant seasonality**.

**Interpretation:**
- A slow decline in autocorrelation confirms that past values influence future values, indicating **trend persistence**.
- No clear seasonal spikes were observed, meaning that seasonality is **weak or minimal**.

![ACF Plot](https://github.com/user-attachments/assets/6e0dfb34-cab4-4d5c-a3f4-a1b738804d4e)


---

## 📊 Step 2: Classical Decomposition (Multiplicative)
### **Decomposition Components:**
1. **Trend:** The data showed an **increasing trend** from 2010 to 2020, followed by a sharp decline during **2020 (COVID-19 impact)** and a slow recovery thereafter.
2. **Seasonality:** A repeating seasonal pattern was observed, though with small variations.
3. **Residual Component:** The remainder fluctuated, with a **spike in volatility during 2020**.

![image](https://github.com/user-attachments/assets/3df3ef06-ac31-42d0-808f-3f8c89295e55)


**Interpretation:**
- The **trend component** dominates, suggesting that labor force participation is mainly influenced by macroeconomic factors rather than seasonal effects.
- **Seasonal variation exists** but is weak (seasonal indices are close to 1).
- **COVID-19 significantly impacted the labor force participation rate**, as reflected in the residuals.

---

## 📈 Step 3: Holt-Winters Exponential Smoothing
### **Holt-Winters Model Fit & Seasonal Coefficients**
- A **multiplicative Holt-Winters model** was applied to the dataset.
- Seasonal coefficients were extracted, showing values **close to 1**, reinforcing the observation that seasonality is weak.

![image](https://github.com/user-attachments/assets/f34183b3-a672-482e-96fc-7a3a60af4a67)
![image](https://github.com/user-attachments/assets/a08a11b9-965f-4cfc-9913-8607efd94d7d)



**Interpretation:**
- The model successfully captures trend and seasonality.
- Since the seasonal indices remain close to 1, fluctuations are not strong.

---

## 📊 Step 4: STL Decomposition with Random Walk Forecasting
### **STL Components & Forecasting**
- **STL decomposition** was performed to separate trend and seasonality.
- A **random walk with drift** model was used to forecast the next 12 months.

![image](https://github.com/user-attachments/assets/835b6dc9-1a89-41c7-8d46-053965799986)
![image](https://github.com/user-attachments/assets/d4afa015-813a-4626-be3a-3f7b41fca631)


**Interpretation:**
- STL decomposition allows for flexible trend and seasonality modeling.
- The **STL + RW Drift model adapts better to long-term changes**.

---

## 📈 Step 5: Forecasting Comparison
### **Holt-Winters vs. STL Forecasts**
- Both models were used to generate **12-month forecasts**.
- RMSE was computed to compare their accuracy.

| Model        | RMSE (Lower is Better) |
|-------------|------------------|
| Holt-Winters | .4153 |
| STL + RW Drift | .3486 |


**Final Interpretation:**
- **STL RMSE < Holt-Winters RMSE:** STL decomposition is better at adapting to long-term variations.


---

## 📌 Conclusion
- **Labor force participation follows a clear long-term trend** with minor seasonal effects.
- **The 2020 economic shock (COVID-19) had a noticeable impact** on the labor market.
- **Holt-Winters and STL decomposition both provide valuable forecasts**, with STL being more flexible in handling evolving trends. For the labor force participation rate, the STL model seems to provide better forecasts. 

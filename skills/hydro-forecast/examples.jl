using HydroTools
using Dates

lat = 20.0
doy = 120

ws = HourAngleSunSet(lat, doy)
# doy
cal_Rsi_toa(lat, doy)

# date
date = Date(2010, 6, 12)
doy = dayofyear(date)
cal_Rsi_toa(lat, doy)

# datetime
time = DateTime(2010, 6, 12)
doy = dayofyear(date)
Rsi = cal_Rsi_toa(lat, doy) # [MJ d-1 m-2]


MJ2W(Rsi) # [MJ d-1 m-2] to [W m-2]

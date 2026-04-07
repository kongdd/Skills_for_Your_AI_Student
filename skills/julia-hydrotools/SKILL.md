---
name: julia-hydrotools
description: "Calculate shortwave/longwave radiation, potential evapotranspiration (PET/ET0), sunrise/sunset times, and humidity variables using Julia HydroTools. Use when computing meteorological or hydrological base variables, solar radiation, or evapotranspiration estimates."
---

# Julia HydroTools Skill

## Runtime

- Load: `using HydroTools`
- Install if missing: `using Pkg; Pkg.add("HydroTools")`

## Key Functions

### `cal_Rsi_toa(lat, J)` — Daily extraterrestrial radiation

- `lat`: latitude in degrees (scalar)
- `J`: day of year (scalar)
- Returns: `MJ m⁻² day⁻¹`
- For vectors, use broadcasting: `cal_Rsi_toa.(lat, J)`
- Convert to W m⁻²: `MJ2W(value)`

```julia
using HydroTools, Dates

lat = 20.0
date = Date(2010, 6, 12)
Rsi = cal_Rsi_toa(lat, dayofyear(date))  # MJ m⁻² day⁻¹
Rsi_W = MJ2W(Rsi)                        # W m⁻²
```

### `HourAngleSunSet(lat, doy)` — Sunset hour angle

```julia
ws = HourAngleSunSet(20.0, 120)
```

## File Saving

```julia
using RTableTools
fwrite(df, "out.csv")  # df is a DataFrame
```

See `examples.jl` for a complete workflow with radiation and unit conversion.

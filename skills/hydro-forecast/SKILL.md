---
name: hydro-forecast
description: "Run hydrological forecasting models (MarrMot, XAJ, TCN, LSTM, KAN) in Julia using HydroTools. Use when building flood forecasting pipelines, calibrating hydrological models, or evaluating streamflow predictions with train/test/validation splits."
---

# Hydrological Forecasting Skill

## Runtime Environment

- Requires Julia with `HydroTools`: `using Pkg; Pkg.add("HydroTools")`
- File I/O via `RTableTools`: `fwrite(df, "out.csv")`

## Before Running

Prompt the user to confirm:
1. **Data path**: CSV with prepared input (X) and observed streamflow (Y)
2. **Model choice**: `MarrMot`, `XAJ`, `TCN`, `LSTM`, or `KAN`
3. **Parameter file** (complex models only): JSON file with model parameters — see example below

<details>
<summary>Example parameter JSON (land surface / eco-hydrology model)</summary>

```json
{
    "clumping_index": 0.62,
    "LAI_max_o": 4.5,
    "LAI_max_u": 2.4,
    "z00": 1.33,
    "mass_overstory": 35,
    "mass_understory": 10,
    "root_depth": 0.6,
    "minimum_stomatal_resistance": 150,
    "z_canopy_o": 20,
    "z_canopy_u": 3,
    "g1_w": 8,
    "VCmax25": 62.5
}
```
</details>

## Workflow

### 1. Framework entry point

```julia
function hydro_forecast(X::AbstractArray, Y::AbstractArray; model::Function, outdir="OUTPUT")
  mkpath(outdir)
  res  # returns a NamedTuple
end
```

**Inputs**: `X` (drivers), `Y` (observed Q), `model` function
**Outputs** (saved to `outdir/`):

| File | Content |
|------|---------|
| `output.csv` | DataFrame with `date`, `Qsim` columns for train/test/valid |
| `gof.csv` | Goodness-of-fit metrics (NSE, KGE, RMSE) per dataset |
| `info_flood.csv` | Flood event info: `id`, `time_beg`, `time_end`, `duration`, `Q_peak`, `Q_min` |
| `dat_flood.csv` | Driving data for each flood event |
| `evaluation.csv` | Per-event simulation accuracy (peak flow, time-to-peak pass rates) |

### 2. Model call convention

```julia
Ysim = Model(X, Y; params, state)  # Lux design philosophy
```

### 3. Internal modules

- **`flood_division`**: Flood event delineation (uses R)
- **Dataset splitting**: Train / test / valid partitions
- **Loss design**: Build loss from GOF metrics (KGE, NSE, RMSE) — loss must decrease for better fit
- **Evaluation**: Per-event peak flow and time-to-peak pass rates across all three datasets

### 4. Post-run

- Generate comparison plots of observed vs simulated streamflow
- Summarize `evaluation.csv` for overall forecast accuracy

## File Saving

```julia
using RTableTools
fwrite(df, "out.csv")  # df is a DataFrame
```

See `examples.jl` for a complete radiation calculation workflow using HydroTools.

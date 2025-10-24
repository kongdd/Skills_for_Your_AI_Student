# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

"Skills for Your AI Student" (给你的AI研究生传授技能) is a repository designed to teach domain-specific skills to AI assistants, particularly focused on geoscience research and Julia programming. The repository allows researchers to encode their expertise as reusable "skills" that Claude Code can leverage.

## Architecture

The repository uses a **skill-based architecture** where each skill is a self-contained module in the `skills/` directory:

```
skills/
├── julia-hydrotools/    # Hydrological calculations (radiation, evapotranspiration, etc.)
│   ├── SKILL.md        # Skill documentation and function reference
│   └── examples.jl     # Usage examples
└── julia-numerical/     # General numerical computing with Julia
    ├── SKILL.md        # Skill documentation
    ├── examples.jl     # Comprehensive examples
    └── test_basic.jl   # Basic tests
```

### Skill Structure

Each skill follows this pattern:
- **SKILL.md**: Contains frontmatter with `name` and `description`, followed by documentation including:
  - Runtime environment requirements
  - Function signatures and usage
  - Package dependencies
  - File I/O conventions
- **examples.jl**: Executable Julia code demonstrating skill usage
- **test_*.jl**: Optional test files

## Working with Julia Skills

### Executing Julia Code

Julia code can be executed directly using the pre-approved command pattern:
```bash
julia -e "using HydroTools; cal_Rsi_toa(20.0, 120)"
```

This command pattern is whitelisted in `.claude/settings.local.json` for automatic execution.

### Julia Package Management

Skills may depend on Julia packages. Install missing packages with:
```julia
using Pkg
Pkg.add("PackageName")
```

### Common Julia Packages Used

**julia-hydrotools skill**:
- `HydroTools`: Hydrological calculations (radiation, PET, humidity)
- `Dates`: Date/time handling
- `DataFrames`: Data manipulation
- `RTableTools`: CSV I/O (use `fwrite(df, "out.csv")`)

**julia-numerical skill**:
- `LinearAlgebra`: Matrix operations
- `Statistics`: Statistical functions
- `QuadGK`: Numerical integration
- `Optim`: Optimization
- `Roots`: Root finding

## HydroTools Key Functions

When using the `julia-hydrotools` skill:

- `cal_Rsi_toa(lat, J)`: Calculate daily extraterrestrial radiation
  - `lat`: latitude in degrees (scalar)
  - `J`: day of year (scalar)
  - Returns: MJ m⁻² day⁻¹
  - For vectors, use broadcasting: `cal_Rsi_toa.(lat, J)`
  - Convert to W m⁻²: `MJ2W(value)`

- `HourAngleSunSet(lat, doy)`: Calculate sunset hour angle

Always specify units when returning results to users (e.g., "32.4 MJ m⁻² day⁻¹").

## Date Handling in Julia

```julia
using Dates

# From Date
date = Date(2010, 6, 12)
doy = dayofyear(date)

# From DateTime
time = DateTime(2010, 6, 12)
doy = dayofyear(time)
```

## File I/O

Save DataFrames using `RTableTools`:
```julia
using RTableTools
fwrite(df, "out.csv")  # df is a DataFrame
```

## Future Skills (TODO)

The repository roadmap includes skills for:
- R programming (data.table, dplyr, ggplot2)
- Google Earth Engine (GEE)
- Carbon-water flux modeling (PMLV2, BEPS.jl)
- Hydrological forecasting
- Land surface processes
- Groundwater and soil moisture/heat flux modeling
- Geospatial data processing

## Permission Configuration

`.claude/settings.local.json` configures pre-approved commands:
- `Bash(mkdir:*)`: Create directories
- `Bash(julia -e:*)`: Execute Julia one-liners
- `Skill(julia-hydrotools)`: Use julia-hydrotools skill

These commands execute without requiring user approval.

# Unix Philosophy Example: Before & After

This document demonstrates the transformation from monolithic code to Unix-style minimalist code.

## Before: Monolithic Script (133 lines)

```r
# calculate_monthly_avg_expert.R - Everything in one file
library(data.table)

cat("=== Using R Expert Skill ===\n\n")
dt <- fread("data.csv")
dt[, `:=`(date_obj = as.IDate(date), year = year(as.IDate(date)), ...)]
# ... 130+ lines of mixed functions, analysis, and output
```

**Problems:**
- ❌ 133 lines - too long
- ❌ Functions mixed with script logic
- ❌ Hard to reuse functions
- ❌ Difficult to test individual components
- ❌ Verbose with excessive comments and output

## After: Unix-Style Separation

### Library: `lib/stats.R` (31 lines)

```r
# Pure, reusable functions
add_date_components <- function(dt) { ... }
monthly_stats <- function(dt, value_col = "Rsi_Wm2") { ... }
find_extremes <- function(stats_dt) { ... }
```

### Script: `scripts/monthly_avg.R` (19 lines)

```r
#!/usr/bin/env Rscript
library(data.table)
source("lib/stats.R")

dt <- fread("guangzhou_toa_radiation_2025.csv")
add_date_components(dt)
result <- monthly_stats(dt, "Rsi_Wm2")
fwrite(result, "monthly_avg_output.csv")

extremes <- find_extremes(result)
cat(sprintf("Highest: %s (%.2f W/m²)\n", extremes$max$month_name, extremes$max$mean))
cat(sprintf("Lowest: %s (%.2f W/m²)\n", extremes$min$month_name, extremes$min$mean))
```

### Quick Script: `scripts/quick_summary.R` (11 lines)

```r
#!/usr/bin/env Rscript
suppressPackageStartupMessages(library(data.table))

args <- commandArgs(trailingOnly = TRUE)
file <- if (length(args) > 0) args[1] else "guangzhou_toa_radiation_2025.csv"

dt <- fread(file)
dt[, month := month(as.IDate(date))]
dt[, .(mean = mean(Rsi_Wm2)), by = month][order(month)] |> fwrite(stdout())
```

## Comparison

| Metric | Before | After |
|--------|--------|-------|
| **Total Lines** | 133 | 50 (31 lib + 19 script) |
| **Script Lines** | 133 | 19 |
| **Reusable?** | No | Yes (lib functions) |
| **Testable?** | Hard | Easy (test lib separately) |
| **Composable?** | No | Yes (mix & match functions) |
| **Pipeline Support** | No | Yes (quick_summary.R) |

## Benefits of Unix Style

### 1. **Simplicity**
```bash
# Quick analysis - just 11 lines
Rscript scripts/quick_summary.R data.csv
```

### 2. **Reusability**
```r
# Use the same functions for different analyses
source("lib/stats.R")

# Analysis 1: Monthly averages
monthly_stats(dt, "temperature")

# Analysis 2: Find extremes
find_extremes(result)
```

### 3. **Composability**
```r
# Chain operations
dt |>
  add_date_components() |>
  monthly_stats("Rsi_Wm2") |>
  find_extremes()
```

### 4. **Testability**
```r
# Test individual functions
testthat::test_that("monthly_stats works", {
  dt <- data.table(date = "2025-01-01", value = 100)
  add_date_components(dt)
  result <- monthly_stats(dt, "value")
  expect_equal(nrow(result), 1)
})
```

### 5. **Pipeable**
```bash
# Unix-style pipelines
cat data.csv | Rscript scripts/quick_summary.R > monthly_means.csv
```

## Unix Philosophy Checklist

When writing code, ask:

- ✅ Is each function < 20 lines?
- ✅ Does each function do ONE thing?
- ✅ Are functions separated from scripts?
- ✅ Can functions be tested independently?
- ✅ Can functions be reused in other contexts?
- ✅ Is the script < 30 lines?
- ✅ Could this be simpler?

## Key Takeaways

1. **Separate**: Functions in `lib/`, scripts in `scripts/`
2. **Simplify**: Shorter is usually better
3. **Focus**: One function = one purpose
4. **Compose**: Small pieces → powerful combinations
5. **Test**: Pure functions are easy to test

---

**Remember**: "Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away." - Antoine de Saint-Exupéry

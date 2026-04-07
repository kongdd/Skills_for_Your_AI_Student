---
name: julia-numerical
description: "Execute numerical calculations and mathematical computations using Julia. Use when performing matrix operations, linear algebra, numerical integration, optimization, differential equations, or statistics in Julia."
---

# Julia Numerical Calculation Skill

## Quick Start

```julia
using LinearAlgebra

A = [1 2; 3 4]
eigenvals, eigenvecs = eigen(A)
A_inv = inv(A)
```

## Core Patterns

### Numerical Integration

```julia
using QuadGK
result, error = quadgk(x -> sin(x) * exp(-x), 0, Inf)
```

### Optimization

```julia
using Optim
result = optimize(x -> (x[1] - 2)^2 + (x[2] - 3)^2, [0.0, 0.0])
```

### Statistics

```julia
using Statistics
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
mean(data), std(data), median(data)
```

## Workflow

1. Identify required packages for the problem
2. Verify packages are available: `using Pkg; Pkg.status("PackageName")`
3. Write and execute Julia code
4. Validate output ranges and types before returning results

## Key Packages

| Package | Purpose |
|---------|---------|
| `LinearAlgebra` | Matrix ops, eigenvalues, decompositions |
| `QuadGK` | Numerical integration |
| `Optim` | Optimization algorithms |
| `DifferentialEquations` | ODE/PDE solvers |
| `Statistics` | Mean, std, median, var |
| `Distributions` | Probability distributions |
| `Roots` | Root finding |

See `examples.jl` for extended examples and `test_basic.jl` for verification tests.

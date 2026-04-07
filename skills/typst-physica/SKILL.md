---
name: typst-physica
description: "Write differential and partial differential equations in Typst using physica notation, and convert LaTeX math formulas to Typst. Use when writing PDE/ODE formulas in Typst documents or converting LaTeX equations to Typst syntax."
---

# Package Import

Import at the top of the Typst document (skip if `modern-cug-report` is already imported):

```typst
#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2025", header: "")
```

# Partial & Total Derivatives

| LaTeX | Typst (physica) |
|-------|-----------------|
| `\frac{\partial \theta}{\partial t}` | `pdv(theta, t)` |
| `\frac{d \theta}{d t}` | `dv(theta, t)` |

```typst
pdv(theta, t)   // correct — partial derivative
dv(theta, t)    // correct — total derivative

// WRONG: do not use partial.diff directly
(partial.diff theta) / (partial.diff t)  // incorrect
```

# Text in Formulas

Subscript text must be quoted:

```typst
q_("infiltration")   // correct
q_(infiltration)     // WRONG — missing quotes
```

# Fractions

LaTeX `\frac{y}{x}` becomes `y/x`. For multi-variable numerators/denominators, wrap in parentheses:

- `\frac{y z}{x}` → `(y z) / x`

# Formatting Rules

- Two blank lines before each level-1 heading (except the first)
- First level-1 heading needs no leading blank lines

See `examples.typ` for Richards equation examples and `example_physica.typ` for advanced physica notation.

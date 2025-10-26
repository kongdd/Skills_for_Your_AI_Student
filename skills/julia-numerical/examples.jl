# Julia Numerical Calculation Examples
# This file contains common numerical computation patterns

# ============================================================================
# Linear Algebra Examples
# ============================================================================

function linear_algebra_examples()
    using LinearAlgebra

    println("=== Linear Algebra Examples ===")

    # Matrix creation and basic operations
    A = [1 2 3; 4 5 6; 7 8 10]
    b = [1, 2, 3]

    println("Matrix A:")
    println(A)

    # Solve linear system Ax = b
    x = A \ b
    println("\nSolution to Ax = b:")
    println(x)

    # Eigenvalues
    eigenvals, eigenvecs = eigen(A)
    println("\nEigenvalues:")
    println(eigenvals)

    # Singular value decomposition
    U, S, V = svd(A)
    println("\nSingular values:")
    println(S)

    # Determinant and norm
    println("\nDeterminant: ", det(A))
    println("Frobenius norm: ", norm(A))
end


# ============================================================================
# Numerical Integration Examples
# ============================================================================

function integration_examples()
    using QuadGK

    println("\n=== Numerical Integration Examples ===")

    # Integrate sin(x) from 0 to π
    f1(x) = sin(x)
    result1, error1 = quadgk(f1, 0, π)
    println("∫sin(x)dx from 0 to π = ", result1)
    println("Estimated error: ", error1)

    # Integrate exp(-x^2) from -∞ to ∞ (Gaussian)
    f2(x) = exp(-x^2)
    result2, error2 = quadgk(f2, -Inf, Inf)
    println("\n∫exp(-x²)dx from -∞ to ∞ = ", result2)
    println("Theoretical value: ", sqrt(π))

    # Integrate 1/(1+x^2) from 0 to 1
    f3(x) = 1/(1 + x^2)
    result3, error3 = quadgk(f3, 0, 1)
    println("\n∫1/(1+x²)dx from 0 to 1 = ", result3)
    println("Theoretical value (π/4): ", π/4)
end

# ============================================================================
# Optimization Examples
# ============================================================================

function optimization_examples()
    using Optim

    println("\n=== Optimization Examples ===")

    # Simple quadratic function
    f(x) = (x[1] - 2)^2 + (x[2] - 3)^2

    result = optimize(f, [0.0, 0.0])
    println("Minimize f(x,y) = (x-2)² + (y-3)²")
    println("Minimum found at: ", Optim.minimizer(result))
    println("Minimum value: ", Optim.minimum(result))

    # Rosenbrock function (more challenging)
    rosenbrock(x) = (1 - x[1])^2 + 100(x[2] - x[1]^2)^2

    result2 = optimize(rosenbrock, [0.0, 0.0])
    println("\nMinimize Rosenbrock function")
    println("Minimum found at: ", Optim.minimizer(result2))
    println("Minimum value: ", Optim.minimum(result2))
end

# ============================================================================
# Statistics Examples
# ============================================================================

function statistics_examples()
    using Statistics

    println("\n=== Statistics Examples ===")

    data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]

    println("Data: ", data)
    println("\nStatistical measures:")
    println("Mean: ", mean(data))
    println("Median: ", median(data))
    println("Standard deviation: ", std(data))
    println("Variance: ", var(data))
    println("Minimum: ", minimum(data))
    println("Maximum: ", maximum(data))
    println("Range: ", maximum(data) - minimum(data))

    # Quantiles
    println("\nQuantiles:")
    println("25th percentile: ", quantile(data, 0.25))
    println("50th percentile: ", quantile(data, 0.50))
    println("75th percentile: ", quantile(data, 0.75))
end

# ============================================================================
# Root Finding Examples
# ============================================================================

function root_finding_examples()
    using Roots

    println("\n=== Root Finding Examples ===")

    # Find root of f(x) = x^3 - 2
    f(x) = x^3 - 2
    root = find_zero(f, 1.0)
    println("Root of x³ - 2 = 0: ", root)
    println("Verification: f(root) = ", f(root))

    # Find root of f(x) = sin(x) - 0.5
    f2(x) = sin(x) - 0.5
    root2 = find_zero(f2, 0.5)
    println("\nRoot of sin(x) - 0.5 = 0: ", root2)
    println("Verification: f(root) = ", f2(root2))
end

# ============================================================================
# Main execution
# ============================================================================

if abspath(PROGRAM_FILE) == @__FILE__
    linear_algebra_examples()
    integration_examples()
    optimization_examples()
    statistics_examples()
    root_finding_examples()
end

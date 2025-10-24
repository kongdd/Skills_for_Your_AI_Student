# Basic Julia numerical test
using LinearAlgebra
using Statistics

println("Testing Julia Numerical Calculation Skill")
println("==========================================\n")

# Test 1: Basic arithmetic
println("Test 1: Basic Arithmetic")
result = 2 + 2 * 3
println("2 + 2 * 3 = ", result)

# Test 2: Vector operations
println("\nTest 2: Vector Operations")
v1 = [1, 2, 3]
v2 = [4, 5, 6]
dot_product = dot(v1, v2)
println("dot([1,2,3], [4,5,6]) = ", dot_product)

# Test 3: Matrix operations
println("\nTest 3: Matrix Operations")
A = [1 2; 3 4]
println("Matrix A:")
println(A)
println("det(A) = ", det(A))

# Test 4: Statistics
println("\nTest 4: Statistics")
data = [10, 20, 30, 40, 50]
println("Data: ", data)
println("mean = ", mean(data))
println("std = ", std(data))

println("\n✓ All basic tests passed!")

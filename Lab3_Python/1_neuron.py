# Lab 3, Q1: Write a Python program to create a neuron and predict its output
# using the threshold activation function.

# Single neuron with threshold (step) activation function
inputs = [1, 0, 1]
weights = [0.5, -0.4, 0.8]
bias = -0.6
threshold = 0

def step(x):
    return 1 if x >= threshold else 0

net = sum(x * w for x, w in zip(inputs, weights)) + bias
print("Inputs :", inputs)
print("Weights:", weights, " Bias:", bias)
print(f"Net input = {net:.2f}")
print("Predicted output =", step(net))

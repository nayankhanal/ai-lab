# Lab 3, Q3: Write a Python program to implement backpropagation algorithm, use
# learning rate as 0.1 and assume input and target output on your own.

# Backpropagation for a 2-2-1 network (sigmoid), learning rate 0.1
import math

sig = lambda x: 1 / (1 + math.exp(-x))

x, target, lr = [0.05, 0.10], 0.01, 0.1
w_h = [[0.15, 0.20], [0.25, 0.30]]   # input -> hidden weights
b_h = 0.35
w_o = [0.40, 0.45]                   # hidden -> output weights
b_o = 0.60

for epoch in range(1, 1001):
    # forward pass
    h = [sig(sum(w_h[j][i] * x[i] for i in range(2)) + b_h) for j in range(2)]
    y = sig(sum(w_o[j] * h[j] for j in range(2)) + b_o)
    error = 0.5 * (target - y) ** 2

    # backward pass
    delta_o = (y - target) * y * (1 - y)
    delta_h = [delta_o * w_o[j] * h[j] * (1 - h[j]) for j in range(2)]
    for j in range(2):
        w_o[j] -= lr * delta_o * h[j]
        for i in range(2):
            w_h[j][i] -= lr * delta_h[j] * x[i]

    if epoch in (1, 10, 100, 250, 500, 1000):
        print(f"Epoch {epoch:4d}: output = {y:.4f}, error = {error:.6f}")

print(f"\nTarget = {target}, final output = {y:.4f}")
print("Updated hidden weights:", [[round(w, 4) for w in r] for r in w_h])
print("Updated output weights:", [round(w, 4) for w in w_o])

# Lab 3, Q2: Write a Python program to train AND Gate using Perceptron Learning
# Algorithm.

# Train AND gate using the Perceptron Learning Algorithm
X = [[0, 0], [0, 1], [1, 0], [1, 1]]
T = [0, 0, 0, 1]
w, b, lr = [0.0, 0.0], 0.0, 0.1

step = lambda x: 1 if x >= 0 else 0

for epoch in range(1, 101):
    errors = 0
    for x, t in zip(X, T):
        y = step(w[0] * x[0] + w[1] * x[1] + b)
        e = t - y
        if e:
            errors += 1
            w = [w[i] + lr * e * x[i] for i in range(2)]
            b += lr * e
    print(f"Epoch {epoch}: w = [{w[0]:.1f}, {w[1]:.1f}], b = {b:.1f}, errors = {errors}")
    if errors == 0:
        break

print("\nTrained AND gate:")
for x, t in zip(X, T):
    print(f"{x[0]} AND {x[1]} = {step(w[0] * x[0] + w[1] * x[1] + b)}  (target {t})")

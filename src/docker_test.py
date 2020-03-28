import numpy as np

with open("../data/input.txt", "r") as file:
	data = file.readlines()

text = data[0][:-1]
print(text[::-1])

with open("../data/output.txt", "w") as file:
	file.write(text[::-1])

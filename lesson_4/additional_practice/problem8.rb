# What happens when we modify an array while we are iterating over it? 

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# prints: 1 3

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# prints: 1 2

# iterators operate on the original array, not on a copy.
# This results in unexpected values. Do not mutate a collection while iterating over it.
# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# the return value of the select method is an array with the value of [1, 2, 3]
# select method selects elements based on the return value of the block 
# when the block returns a truthy value, that element is selected
# since the last executed line of the block is 'hi', and this string literal expression evaluates to true,
# all of the elements of the original array are selected
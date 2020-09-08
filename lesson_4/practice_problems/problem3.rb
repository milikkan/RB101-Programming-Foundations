# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# return value of reject in this code is [1, 2, 3], it returns all elements of the original array
# reject method considers the falsiness of the return value of the block. Since puts returns nil and nil is falsey, all
# the elements are selected
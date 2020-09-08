# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Return value is [nil, 'bear']
# map method always returns an array whose elements are the return value of the block for each execution.
# block takes 2 arguments (key and value) when the mehod is uaed with a hash. 
# For the first iteration, the value argument is 'ant'. Since its length is not greater than 3 if statement returns nil and this also becomed the return value of the block. For the second iteration, block returns the value itself.
# When none of the conditions in an if statement evaluates as true, the if statement itself returns nil.

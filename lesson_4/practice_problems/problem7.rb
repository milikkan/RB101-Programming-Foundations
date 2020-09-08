# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# block's return value is a boolean object dependimg of the current block argument
# it is determined by the last line execute dinside the block which is num.odd? and odd? method returns a true or false object. 
# return value of any? method is also a boolean object. If the block returns a truthy value for any element, any? method returns true. In this code, return value is true since the block returns true for the element 1 and 3
# the output is also 1 because when the block returns a truthy value the method returns at that point, leaving remaining elements unevaluated.
# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# return value is [1, nil, nil] and code outputs "2 3"
# we can determine the block's return value by looking at the return value of the last statement evaluated within the block.
# for the first iteration, block argument num is 1. Since num > 1 evaluates to false the value of else block is returned, which is 1 iteself.
# for the second and third iterations, num > 1 evaluates to true and the return value of "puts num" is returned, which is nil.
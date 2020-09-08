# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# return value will be this hash: { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# each_with_object takes a collection argument in addtition to its block argument and returns this argument
# the block takes 2 arguments: first is the current element of the collection, second is the collection that is
# passed in as the argument
# The hash argument is passed in the block and its updated value is returned each time the block executed.
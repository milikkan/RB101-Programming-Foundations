# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# when a block is provided, count method counts the number of elements for which the block returns a truthy value.
# In this particular example, the block checks the length of the string elements. When the length is less than 4 it 
# results in true and count is incremented. The result is 2.
# We can find out about this in ruby documentation. Enumerable#count
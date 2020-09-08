# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# returnvalue is 11. Array#pop method destructively removes the last element from the array and returns this element.
# Methods are chained in this statement. String#size method is called on the return value of the pop method.
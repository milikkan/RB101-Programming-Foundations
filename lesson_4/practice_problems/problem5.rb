# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# Hash#shift method removes a key-value pair from the hash and returns it as 2-element array where the first element 
# is the key and the second element is the value
# original hash is mutated after the operation. We can learn about this behavior from the documentation
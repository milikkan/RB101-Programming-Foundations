# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]

# if we don't want the original object not modified we can clone the value before the operation
# like this 
# informal_greeting = greetings[:a].clone
# now original greetings hash remains intact

# second way: we can use + (concatenation) instead of << (shovel)
# like this
# informal_greeting = informal_greeting + ' there'
# now also original greetings hash remains intact

informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# { :a=>'hi there' }
# original objet is modified by String#<< method because informal_gretting variable
# refers to the String 'hi' object.
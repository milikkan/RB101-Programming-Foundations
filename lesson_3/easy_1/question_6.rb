# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# 1
p "Four score and " + famous_words
# 2
p "Four score and " << famous_words
# 3
p famous_words.prepend("Four score and ")
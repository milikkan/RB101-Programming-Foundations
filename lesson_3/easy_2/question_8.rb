# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".
index = advice.index("house")

# using String#slice!
p advice.slice!(0, index)
p advice

# using String#slice
advice = "Few things in life are as important as house training your pet dinosaur."
advice = advice.slice(0, index)
p advice
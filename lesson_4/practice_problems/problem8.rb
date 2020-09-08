# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# Array#take method returns the first n elements as an array. It does not mutate the caller.
# We can check the documentation but examples there are not enough. I needed to check it myself on irb to make sure hor the method works.
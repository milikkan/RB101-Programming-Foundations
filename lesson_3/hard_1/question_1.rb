# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

p greeting

# prints nil, because if a local variable is initialized in an if branch, it will be initialized to nil
# even if that branch doesn't get executed
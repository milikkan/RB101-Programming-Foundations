# What will be printed by each of these code groups?

# C)

def mess_with_vars(one, two, three)
  # puts "one inside method - before reassignment: #{one.object_id}"
  # puts "two inside method - before reassignment: #{two.object_id}"
  # puts "three inside method - before reassignment: #{three.object_id}"
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
  # puts "one inside method - after reassignment: #{one.object_id}"
  # puts "two inside method - after reassignment: #{two.object_id}"
  # puts "three inside method - after reassignment: #{three.object_id}"
end

one = "one"
two = "two"
three = "three"

# puts "one before method: #{one.object_id}"
# puts "two before method: #{two.object_id}"
# puts "three before method: #{three.object_id}"

mess_with_vars(one, two, three)

# puts "one after method: #{one.object_id}"
# puts "two after method: #{two.object_id}"
# puts "three after method: #{three.object_id}"

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# "one is: two"
# "two is: three"
# "three is: one"
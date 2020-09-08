# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

total = 0

munsters.each do |_, value|
  total += value["age"] if value["gender"] == "male"
end

puts "Total age of males: #{total}"

# can also be solved using each_value

# munsters.each_value do |value|
#   total += value["age"] if value["gender"] == "male"
# end

# puts "Total age of males: #{total}"
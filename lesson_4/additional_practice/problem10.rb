munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# age_group

munsters.each do |_, value|
  age_group = case value["age"]
              when 0..17 then "kid"
              when 18..64 then "adult"
              else "senior"
              end
  value["age_group"] = age_group
end

p munsters
# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
# ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

hsh = {}

statement.chars.each do |letter|
  if ('A'..'Z').include?(letter) || ('a'..'z').include?(letter)
    hsh.has_key?(letter) ? hsh[letter] += 1 : hsh[letter] = 1
  end
end

p hsh
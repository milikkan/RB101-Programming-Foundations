# Each UUID consists of 32 hexadecimal characters, 
# and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def generate_uuid
  characters = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  format = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
  
  result = format.chars.map do |ch|
    ch == 'x' ? characters.sample : '-'
  end

  result.join
end

p generate_uuid
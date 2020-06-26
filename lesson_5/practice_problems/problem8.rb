# Using the each method, write some code to output all of the vowels from the strings.

hsh = {
  first: ['the', 'quick'], 
  second: ['brown', 'fox'], 
  third: ['jumped'], 
  fourth: ['over', 'the', 'lazy', 'dog']
}

wovels = %w(a e i o u)

hsh.each_value do |words|
  words.each do |word|
    word.chars.each do |letter|
      puts letter if wovels.include?(letter)
    end
  end
end

def titleize(sentence)
  words_capitalized = sentence.split.map { |word| word.capitalize }
  words_capitalized.join(' ')
end


words = "the flintstones rock"

# words = "The Flintstones Rock"
p titleize(words)
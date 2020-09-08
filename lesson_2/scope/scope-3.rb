2.times do
  a = 'hi'
  puts a # 'hi'
end

loop do
  puts a # NameError
  break
end

puts a # NameError
a = 1

loop do
  b = 2

  loop do
    c = 3
    puts a # 1
    puts b # 2
    puts c # 3
    break
  end

  puts a # 1
  puts b # 2
  puts c # NameError
  break
end

puts a # 1
puts b # NameError
puts c # NameError

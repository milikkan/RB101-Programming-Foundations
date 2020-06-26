n = 10

1.times do |n|
  n = 11 # outer n is shadowed and inaccessible
end

puts n # 10
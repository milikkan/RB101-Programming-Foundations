def multiply(arr, num)
  result = []
  counter = 0

  loop do
    break if counter == arr.size
    result << arr[counter] * num
    counter += 1
  end

  result
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
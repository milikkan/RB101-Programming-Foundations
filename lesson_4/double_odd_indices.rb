def double_odd_indices(arr)
  result = []
  counter = 0

  loop do
    break if counter == arr.length
    item = arr[counter]
    item *= 2 if counter.odd?
    result << item
    counter += 1
  end

  result
end


my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]

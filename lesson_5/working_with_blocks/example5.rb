[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# no output

# return value
# [[2, 4], [6, 8]]

# breakdown of code
=begin

line    action          object                side effect         return value          return value used?
------  ----------      -----------           --------------      --------------        --------------------
1       method call     [[1, 2], [3, 4]]      none                [[2, 4], [6, 8]]           no                            
        (map)

1-5     outer block     each array from       none                transformed new array     yes, used by outer map              
        execution       outer array                               from each sub array

2       method call     each array from       none                new array                 yes, used to determine
        (map)           outer array                                                         outer block return value

2-4     inner block     each integer from     none                new integer               yes, by inner map  
        execution       sub array

3       multiplication  each integer from     none                new integer               yes, used to determine
                        sub array                                                           inner block return value 
=end
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# output

# 18
# 7
# 12

# breakdown of code
=begin

line      action          object                side effect         return value          return value used?
------    ----------      -----------           --------------      --------------        --------------------
1         variable        none                  none                [[18, 7], [3, 12]]    no
          assignment

1         method call     [[18, 7], [3, 12]]    none                calling object        yes, used by var.ass.
          (each)                                                    [[18, 7], [3, 12]]    to my_arr
 
1-7       block execution each sub-array        none                each sub-array        no

2         method call     each sub-array        none                calling object        yes, determines the
          (each)                                                    (sub-array)           return value of block 
                                                                                          between lines 1-7

2-6       block execution each integer in       none                nil                   no 
                          sub-array                                                         

3         comparison (>)  each integer in       none                boolean               yes, by if block 
                          sub-array

3-5       conditional     each integer in       none                nil                   yes, determines the
          (if)            sub-array                                                       return value of block
                                                                                          between lines 2-6

4         method call     integer from          prints string rep.  nil                   yes, determines the 
                          sub array             of integer                                return value of conditional                            

=end
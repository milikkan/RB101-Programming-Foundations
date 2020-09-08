# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin

1. Understanding the problem

- questions
  what is a substring?
  what is a palindrome?
  what happens input is a different data type but not string, do I need to check this?
  what if there are spaces in the input string, will I consider them as a character?

- input: a string
- output: an array of substrings
- rules
  explicit
    - write a method named "palindrome_substrins(input_string) -> array"
    - palindrome words are case sensitive -> daD is not a palindrome because daD != Dad
    - when there is no palindrome in the input str, return an empty array
    - when empty string is given, return an empty array


2. Examples / Test Cases

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

3. Data Structure

input: String
output: Array

4. Algorithm

Main Algorithm
---------------
- create an empty array named "palindromes" to store the results
- find all substrings that are at least two characters long and put them in an array called substrings
- iterate through the substrings array and for each iteration
    check if the current substring is a palindrome
      if it is a palindrome, add the substring to the palindromes array
- return the results array

find_substrings method
-----------------------

input: "halo"

start  0  0   0    1  1    2  
end    1  2   3    2  3    3 

       ha hal halo al alo  lo

- create the result array
- initialize start_index to 0
- initialize end_index to 1
- start a loop (break condition start_index < str.length - 1)
    start a loop (break condition end_index < str.length)
      slice str(start_index, end_index) -> can use str[a..b]
      push substr into result array
      increment end_index by 1
    end inner loop
    increment start_index by 1
    set end_index to start_index plus 1
  end outer loop
- return result array

palindrome? method
-------------------
- reverse the input word (can use String#reverse)
- compare the input word with its reversed form
- return the comparison result

5. Code

=end


str = "abcddcbA"

def palindrome?(input)
  input == input.reverse
end

def find_substrings(input)
  result = []
  start_index = 0
  end_index = 1

  while start_index < input.length - 1
    while end_index < input.length
      result << input[start_index..end_index]
      end_index += 1
    end
    start_index += 1
    end_index = start_index + 1
  end
  result
end

def palindrome_substrings(input_str)
  palindromes = []
  substrings = find_substrings(input_str)
  substrings.each do |substr|
    palindromes << substr if palindrome?(substr)
  end
  palindromes
end

# test cases
p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
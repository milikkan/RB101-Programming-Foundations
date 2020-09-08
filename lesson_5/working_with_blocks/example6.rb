[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

# output : nothing

# return value
# [{:c=>'cat'}]

# breakdown of code
=begin

line    action          object                side effect       return value             return value used?
------  ----------      -----------           --------------    --------------           --------------------
1       method call     array of hashes       none              an array of selected     no 
        (select)                                                hashes [{c: 'cat'}]

1-5     outer block     each hash from        none              true/false               yes, by select    
        execution       array of hashes                     

2       method call     each hash from        none              true/false               yes, determines the return
        (all?)          array of hashes                                                  value of outer block

2-4     inner block     key and value         none              true/false               yes, by all? 
        execution       of each hash

3       value[0]        value (string)        none              first char of str        yes, by comparison

3       method call     key (symbol)          none              string form of symbol    yes, by comparison
        (to_s) 
3       equality        two strings           none              true/false               yes, determines the return 
        comparison                                                                       value of inner block 
=end
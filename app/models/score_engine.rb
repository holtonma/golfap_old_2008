#!/usr/bin/env ruby -w
#
#  Created by Mark Holton on 2007-10-28.
#  Copyright (c) 2007. All rights reserved.


class ScoreEngine
  def average_scores(scores_array)
    #takes an array of scores, and computes the average; returns the average (2 decimal places)
    num_scores = scores_array.length()
    
  end
  
  def get_wordlist_array
    #expected 
    output_array = %w(an array of words)
    output_array
  end
  def hash_function(array_arg)
    #create empty hash named 'expected'
    expected_hash = {}
    #take each element in the array... subtract 1, and raise 2 to that power
    counter = 0
    array_arg.each{ |elem|
      counter += 1
      elemval_minus_one = elem - 1
      hash_val = 2 ** elemval_minus_one
      key_string = "key" + counter.to_s
      expected_hash[key_string] = hash_val
    }
    #expected:
    #expected = {
    #  "key1" => 1,
    #  "key2" => 2,
    #  "key3" => 4,
    #  "key4" => 8,
    #}
    expected_hash #returns expected hash
  end
  def find_all_evens(array_arg)
    return_array = []
    #expected 
    array_arg.each{ |num|
      num_div_2 = num % 2
      if num_div_2 == 0
        #even number
        #return_array.push(num)
        return_array<<num
      else
        #odd number
      end 
    }
    return_array
  end
  def double(array_arg)
    mapped_array = []
    array_arg.map {|item|
      array_elem = item * 2
      mapped_array.push<<array_elem
    }
    mapped_array #return mapped_array
  end
  def black_box(arg_val)
    yield(arg_val, 42) #yeilding flow of control to a block
  end
  def raise_an_exception
    raise RuntimeError
  end
  def save_the_world!
    testvar = "hello world"
  end
  def count_chars str_param
    my_hash = {}
    # Counts chars in +str+ and returns a hash of letters => occurances.
      #turn string into an array of letters
      letters_ary = str_param.scan(/./)
      puts letters_ary.size
      letters_ary.each do |letter|
      	# if that letter is a 'key' in the hash...
      	if my_hash.has_key?(letter)
      	  # then increment the hash value by 1...  
      	  current_val = my_hash[letter]
      	  my_hash[letter] = current_val + 1
      	else
      	  # if it is not a 'key' in the hash, create a new 'key' in the hash
      	  my_hash[letter] = 1
      	end
      end
    ##
    my_hash.keys.each{ |mh|
      output_string = "key: " + mh + " value: " + my_hash[mh].to_s
      puts output_string
    }
    #my_hash
  end
end
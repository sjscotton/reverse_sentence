require "pry"
# A method to reverse the words in a sentence, in place.
# Time complexity: O(n) where n is the length of the string. The pointers are itterating over the length of the string
# and a constant number of steps occu at each itteration
# Space complexity: O(n) where n in the size of the longest word in the string. Other than a few constant size variables
# the only other space used are two variables used to hold a word each, the size depends on the length of the word,
# which at max is the length of the longest word in the string.

def update_leading_pointer(direction, pointer, my_sentence)
  if my_sentence[pointer] == " "
    while my_sentence[pointer] == " "
      direction == "forward" ? pointer += 1 : pointer -= 1
    end
  else
    while my_sentence[pointer] != " " && pointer >= 0 && pointer <= my_sentence.length
      direction == "forward" ? pointer += 1 : pointer -= 1
    end
  end
  return pointer
end

def reverse_sentence(my_sentence)
  return false if !my_sentence
  first_point = 0
  second_point = first_point

  fourth_point = my_sentence.length - 1
  third_point = fourth_point

  second_point = update_leading_pointer("forward", second_point, my_sentence)
  third_point = update_leading_pointer("backward", third_point, my_sentence)

  word_one = my_sentence[first_point..second_point - 1]
  word_two = my_sentence[third_point + 1..fourth_point]
  start = first_point
  last = fourth_point
  return my_sentence if second_point > third_point + 1

  while last >= start
    if second_point - start >= word_two.length
      word_two.length.times do |shift|
        my_sentence[start + shift] = word_two[shift]
      end
      start += word_two.length
      fourth_point = third_point
      third_point = update_leading_pointer("backward", third_point, my_sentence)
      word_two = my_sentence[third_point + 1..fourth_point]
    elsif last - third_point >= word_one.length
      word_one.length.times do |shift|
        my_sentence[last - shift] = word_one[word_one.length - 1 - shift]
      end
      last -= word_one.length
      first_point = second_point
      second_point = update_leading_pointer("forward", second_point, my_sentence)
      word_one = my_sentence[first_point..second_point - 1]
    end
  end
  return my_sentence
end

puts reverse_sentence("this is a sentence")


# A method to reverse the words in a sentence, in place.
# Time complexity: O(n) where n is the length of the string. The pointers are itterating over the length of the string
# and a constant number of steps occur at each itteration
# Space complexity: O(1) Constant, Same number of constant sized variable are used each loop.

def reverse_sentence(my_sentence)
  return false if !my_sentence

  (my_sentence.length / 2).times do |shift|
    temp = my_sentence[shift]
    my_sentence[shift] = my_sentence[my_sentence.length - shift - 1]
    my_sentence[my_sentence.length - shift - 1] = temp
  end
  my_sentence = reverse_words(my_sentence)

  return my_sentence
end

def reverse_words(my_words)
  return false if !my_words
  first_pointer = 0
  while first_pointer < my_words.length
    first_pointer += 1 while my_words[first_pointer] == " "
    second_pointer = first_pointer
    second_pointer += 1 while my_words[second_pointer + 1] != " " && second_pointer < my_words.length - 1
    word_length = second_pointer - first_pointer + 1
    (word_length / 2).times do |shift|
      temp = my_words[first_pointer + shift]
      my_words[first_pointer + shift] = my_words[second_pointer - shift]
      my_words[second_pointer - shift] = temp
    end
    second_pointer += 2
    first_pointer = second_pointer
  end
  return my_words
end

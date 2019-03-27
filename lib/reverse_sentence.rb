require "pry"
# A method to reverse the words in a sentence, in place.
# Time complexity: ?
# Space complexity: ?

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

puts update_leading_pointer("back", 25, "sentence no hi hello there")

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
  # binding.pry
  return my_sentence if second_point > third_point + 1

  while last >= start
    #break if last < start

    # puts "word_one: #{word_one}"
    # puts "word_two: #{word_two}"

    #binding.pry

    if second_point - start >= word_two.length
      puts "++++++++++++++++++++++++++++++++"
      puts "adding word_2 '#{word_two}' starting at start: #{start}"
      puts "third_point : #{third_point}"
      puts "fourth_point : #{fourth_point}"
      word_two.length.times do |shift|
        my_sentence[start + shift] = word_two[shift]
      end
      start += word_two.length

      fourth_point = third_point
      third_point = update_leading_pointer("backward", third_point, my_sentence)
      word_two = my_sentence[third_point + 1..fourth_point]
      puts "third_point : #{third_point}"
      puts "fourth_point : #{fourth_point}"
      puts "word_two: #{word_two}"
    elsif last - third_point >= word_one.length
      puts "================================"
      puts "adding word_1 '#{word_one}' starting at last: #{last}"
      puts "second_point : #{second_point}"
      puts "first_point : #{first_point}"
      puts "sentance before: #{my_sentence}"

      word_one.length.times do |shift|
        my_sentence[last - shift] = word_one[word_one.length - 1 - shift]
      end
      puts "Sentence after: #{my_sentence}"
      last -= word_one.length

      first_point = second_point
      second_point = update_leading_pointer("forward", second_point, my_sentence)
      word_one = my_sentence[first_point..second_point - 1]
      puts "second_point : #{second_point}"
      puts "first_point : #{first_point}"
      puts "word_one: #{word_one}"
    else
      puts "else"
      break
    end

    # puts my_sentence

    break if !word_one && !word_two
  end
  return my_sentence
end

puts reverse_sentence("this is a sentence")

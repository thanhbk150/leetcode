# rails runner script/shortest_word_distance.rb

# Problem: Given an array of strings wordsDict and two different strings that already exist in the array word1 and word2,
# return the shortest distance between these two words in the list.

def shortest_word_distance(words, word1, word2)
  min_distance = words.length

  words.length.times.each do |i|
    if words[i] == word1
      words.length.times.each do |j|
        if words[j] == word2
          min_distance = [min_distance, (i - j).abs].min
        end
      end
    end
  end

  min_distance
end

p "Case 1: 3 = #{shortest_word_distance(%w[practice makes perfect coding makes], 'coding', 'practice')}"
p "Case 2: 1 = #{shortest_word_distance(%w[practice makes perfect coding makes], 'makes', 'coding')}"

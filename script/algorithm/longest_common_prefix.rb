# rails runner script/longest_common_prefix.rb

# Problem: Write a function to find the longest common prefix string amongst an array of strings.
#          If there is no common prefix, return an empty string "".

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.blank?

  prefix = strs.first
  (1..(strs.length - 1)).each do |i|
    while strs[i].index(prefix) != 0
      prefix = prefix.chop
      return '' if prefix.blank?
    end
  end

  prefix
end

p "longest_common_prefix(['flower','flow','flight']): #{longest_common_prefix(%w[flower flow flight])}"
p "['dog','racecar','car']: #{longest_common_prefix(%w[dog racecar car])}"

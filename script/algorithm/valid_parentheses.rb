# rails runner script/valid_parentheses.rb

# Problem:
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
# An input string is valid if:
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Every close bracket has a corresponding open bracket of the same type.

# @param {String} s
# @return {Boolean}

CHARACTER_MAPPING = {
  ')' => '(',
  '}' => '{',
  ']' => '['
}.freeze

def valid_parentheses(string)
  stack = []

  string.length.times.each do |i|
    current_character = string[i]

    # If the current character is a closing bracket.
    if CHARACTER_MAPPING.key? current_character
      # Get the last element of the stack and compare
      return false if stack.pop != CHARACTER_MAPPING[current_character]
    else
      stack << current_character
    end
  end

  stack.empty?
end

p "valid_parentheses('()'): #{valid_parentheses('()')}"
p "valid_parentheses('()[]{}'): #{valid_parentheses('()[]{}')}"
p "valid_parentheses('(]'): #{valid_parentheses('(]')}"

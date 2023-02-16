# rails runner script/palindrome_number.rb

# Problem: Given an integer x, return true if x is a palindrome, and false otherwise.

def is_palindrome(num)
  return false if num < 0 || (!num.zero? && num % 10 == 0)

  revert_number = 0

  while num > revert_number
    revert_number = revert_number * 10 + num % 10
    num = num/10
  end

  num == revert_number || num == revert_number/10
end


p "is_palindrome(121): #{is_palindrome(121)}"
p "is_palindrome(123321): #{is_palindrome(123321)}"
p "is_palindrome(-121): #{is_palindrome(-121)}"
p "is_palindrome(10): #{is_palindrome(10)}"
p "is_palindrome(0): #{is_palindrome(0)}"

# rails runner script/roman_to_int_1.rb

# Problem: Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
# Noted:
  # Symbol       Value
  # I             1
  # V             5
  # X             10
  # L             50
  # C             100
  # D             500
  # M             1000

  # DXCI => D + (C-X) + I = 500 + 90 + 1 = 591
  # CMXCIV => (M-C) + (C-X) + (V-I) = 900 + 90 + 4 = 994

#========== Solution 1 ==========
ROMAIN_TO_INT_1 = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}.freeze

# @param {String} s (Recall that the input is always valid)
# @return {Integer}
def roman_to_int_1(s)
  sum = 0
  i = 0

  while i < s.length
    current_value = ROMAIN_TO_INT_1[s[i]]
    next_value = (i+1 < s.length) ? ROMAIN_TO_INT_1[s[i+1]] : 0

    if current_value < next_value
      sum += (next_value - current_value)
      i += 2
    else
      sum += current_value
      i += 1
    end
  end
  sum
end

# p "roman_to_int_1(III) = 3: #{roman_to_int_1('III')}"
# p "roman_to_int_1(LVIII) = 58: #{roman_to_int_1('LVIII')}"
# p "roman_to_int_1(DXCI) = 591: #{roman_to_int_1('DXCI')}"
# p "roman_to_int_1(CMXCIV) = 994: #{roman_to_int_1('CMXCIV')}"
# p "roman_to_int_1(MCMXCIV) = 1994: #{roman_to_int_1('MCMXCIV')}"


#========== Solution 2 ==========
ROMAIN_TO_INT_2 = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000,
  "IV" => 4,
  "IX" => 9,
  "XL" => 40,
  "XC" => 90,
  "CD" => 400,
  "CM" => 900
}.freeze

def roman_to_int_2(s)
  sum = 0
  i = 0

  while i < s.length
    if i < s.length - 1
      double_symbol = s[i,2]
      if ROMAIN_TO_INT_2.key? double_symbol
        sum += ROMAIN_TO_INT_2[double_symbol]
        i += 2
        next
      end
    end

    sum += ROMAIN_TO_INT_2[s[i]]
    i += 1
  end

  sum
end

p "roman_to_int_2(III) = 3: #{roman_to_int_2('III')}"
p "roman_to_int_2(LVIII) = 58: #{roman_to_int_2('LVIII')}"
p "roman_to_int_2(DXCI) = 591: #{roman_to_int_2('DXCI')}"
p "roman_to_int_2(CMXCIV) = 994: #{roman_to_int_2('CMXCIV')}"
p "roman_to_int_2(MCMXCIV) = 1994: #{roman_to_int_2('MCMXCIV')}"







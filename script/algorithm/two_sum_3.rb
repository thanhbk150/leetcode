# rails runner script/two_sum_3.rb

class TwoSum
  def initialize()
    @nums = []
    @has_sorted = false
  end

  def nums
    @nums
  end

  def add(num)
    @nums << num
    @has_sorted = false
  end

  def find(value)
    unless @has_sorted
      @nums = @nums.sort
      @has_sorted = true
    end

    i = 0
    j = @nums.length - 1

    while i < j
      sum = @nums[i] + @nums[j]

      if sum < value
        i += 1
      elsif sum > value
        j -= 1
      else
        return true
      end
    end

    false
  end
end

two_sum = TwoSum.new
two_sum.add(1) # [1]
two_sum.add(2) # [1,2]
two_sum.add(3) # [1,2,3]
two_sum.add(5) # [1,2,3,5]

p "nums: #{two_sum.nums}"
p "find(4) => #{two_sum.find(4)}" # 1 + 3 = 4, return true
p "find(6) => #{two_sum.find(6)}" # 1 + 5 = 6, return true
p "find(9) => #{two_sum.find(9)}" # No two integers sum up to 7, return false

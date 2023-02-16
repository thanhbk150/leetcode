# rails runner script/bubble_sort.rb

def bubble_sort(nums)
  return nums if nums.empty?

  nums.length.times.each do |i|
    j = i + 1
    while j < nums.length
      if nums[i] < nums[j]
        temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
      end
      j += 1
    end
  end

  nums
end

p "bubble_sort([12, 6, 7, 1, 3, 2, 5, 4, 9]) => #{bubble_sort([12, 6, 7, 1, 3, 2, 5, 4, 9])}"

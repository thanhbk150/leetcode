# rails runner script/find_missing_ranges.rb

def format_range(lower, upper)
  lower == upper ? lower.to_s : "#{lower}->#{upper}"
end

def find_missing_ranges(nums, lower, upper)
  [].tap { |result|
    prev = lower - 1

    (0..nums.length).each do |i|
      curr = i < nums.length ? nums[i] : upper + 1
      result << format_range(prev + 1, curr - 1) if prev + 1 <= curr - 1
      prev = curr
    end
  }
end

p "find_missing_ranges([0,1,3,50,75], 0, 99) => ", find_missing_ranges([0,1,3,50,75], 0, 99)
p "find_missing_ranges([0,1,3,50,75], 1, 66) => ", find_missing_ranges([0,1,3,50,75], 1, 66)
p "find_missing_ranges([-1], -1, -1) => ", find_missing_ranges([-1], -1, -1)

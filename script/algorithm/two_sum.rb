# rails runner script/two_sum.rb

# Problem: Given an array of integers nums and an integer target,
# return indices of the two numbers such that they add up to target.

def two_sum(nums, target)
  hash = {}
  nums.length.times.each do |i|
    offset = target - nums[i]

    return [hash[offset], i] if hash.key? offset

    hash[nums[i]] = i
  end

  return nil
end

p "- Case 1: two_sum([2,7,11,15], 9) => [0,1]: #{two_sum([2, 7, 11, 15], 9)}"
p "- Case 2: two_sum([3,2,4], 6) => [1,2]: #{two_sum([3, 2, 4], 6)}"
p "- Case 3: two_sum([3,3], 6) => [0,1]: #{two_sum([3, 3], 6)}"
p "- Case 4: two_sum([3], 6) => nil: #{two_sum([3], 6)}"

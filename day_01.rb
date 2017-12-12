# Advent of Code day 1: http://adventofcode.com/2017/day/1
#
# Part 1: Find the sum of all digits that
# match the next digit in the sequence.
def sum_if_next_num(str)
  arr = str.chars.map { |n| n.to_i }
  last_num = arr[-1]
  sum = 0
  arr.each do |n|
    sum += n if n === last_num
    last_num = n
  end
  return sum
end

# Part 2: Find the sum of all digits that match the
# digit half the list forward.
def sum_if_half_same(str)
  sum = 0
  arr = str.chars.map { |n| n.to_i }
  halfway = arr.length / 2
  current_idx = 0
  arr.each do |n|
    if (current_idx >= halfway)
      sum += n if arr[current_idx - halfway] === n
    else
      sum += n if arr[current_idx + halfway] === n
    end
    current_idx += 1
  end
  return sum
end

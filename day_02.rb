# Advent of Code day 2: http://adventofcode.com/2017/day/2
#
# Part 1: The goal is to take some input, and do a checksum of
# each row (highest val - lowest val). After all values are
# obtained, sum values.

def checksum_data
  sum = 0
  File.read('./inputs/day_02.txt').lines.each do |line|
    high = 0
    low = 999999
    dataArray = line.gsub(/\n/, '').split(/\t/).map { |d| d.to_i }
    dataArray.each do |item|
      n = item.to_i
      high = n if n > high
      low = n if n < low
    end
    sum += (high - low)
  end
  puts sum
end

checksum_data()

# Part 2: Instead of summing the difference between the largest and
# smallest value, find the value that divides evenly into another number
# on the same line, then sum those values after dividing.

def checksum_even_divide()
  sum = 0
  File.read('./inputs/day_02.txt').lines.each do |line|
    dataArray = line.gsub(/\n/, '').split(/\t/).map { |d| d.to_i }
    dataArray.each do |item|
      for i in 0..dataArray.length - 1 do
        if (item != dataArray[i] && item % dataArray[i] === 0)
          sum += item / dataArray[i]
        end
      end
    end
  end
  puts sum
end

checksum_even_divide()

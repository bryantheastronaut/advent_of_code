# Advent of Code Day 3: http://adventofcode.com/2017/day/3
#
# Part 1:
# You come across an experimental new kind of memory stored on an
# infinite two-dimensional grid.
#
# Each square on the grid is allocated in a spiral pattern starting at
# a location marked 1 and then counting up while spiraling outward.
# For example, the first few squares are allocated like this:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23---> ...
# While this is very space-efficient (no squares are skipped), requested
# data must be carried back to square 1 (the location of the only access
# port for this memory system) by programs that can only move up, down,
# left, or right. They always take the shortest path: the Manhattan Distance
# between the location of the data and square 1.
#
# For example:
#
# Data from square 1 is carried 0 steps, since it's at the access port.
# Data from square 12 is carried 3 steps, such as: down, left, left.
# Data from square 23 is carried only 2 steps: up twice.
# Data from square 1024 must be carried 31 steps.
# How many steps are required to carry the data from the square identified
# in your puzzle input all the way to the access port?
#
# Your puzzle input is 265149.
#

def manhattan_distance(n)
  x = 0
  y = 0
  (0..n).each do |i|
    # this bit was stolen from a SO answer and slightly modified. This kind of math
    # is terribly hard for me! See: https://stackoverflow.com/a/3715915
    j = Math.sqrt(i).round
    k = (j ** 2 - i).abs - j
    p = [k, -k].map {|l| (l + j ** 2 - i - (j % 2)) * 0.5 * (-1) ** j}.map(&:to_i)
    x = p[0].abs
    y = p[1].abs
  end
  x + y - 1
end

p manhattan_distance(265149)

# Part 2: ... not even going to attempt this right now. May come back to it later.
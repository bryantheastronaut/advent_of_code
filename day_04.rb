# Advent of Code Day 4: http://adventofcode.com/2017/day/2
#
# Part 1:
#
# A new system policy has been put in place that requires all accounts
# to use a passphrase instead of simply a password. A passphrase consists
# of a series of words (lowercase letters) separated by spaces.
#
# To ensure security, a valid passphrase must contain no duplicate words.
#
# For example:
#
# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
#
# Part 2:
# For added security, yet another system policy has been put in place.
# Now, a valid passphrase must contain no two words that are anagrams of each other -
# that is, a passphrase is invalid if any word's letters can be rearranged
# to form any other word in the passphrase.

class Validator
  def initialize(dataset)
    @dataset = dataset
  end

  def check_line_for_dupes(line)
    words = line.split(' ')
    l = words.length
    f = words.uniq.length
    if (l == f)
      return 1
    else
      return 0
    end
  end

  def check_line_for_anagrams(line)
    valid = true
    words = line.split(' ')
    l = words.length
    # Goes through each word, rips it up into characters, orders
    # them alphabetically, joins them back together, and passes
    # it back to do the unique length check used in part one.
    words = words.map { |word| word.chars.sort.join }
    return check_line_for_dupes(words.join(' '))
  end

  # Handles part one
  def run_dupe_word_check
    count = 0
    data = @dataset.split(/\n/)
    if data.respond_to?('each')
      data.each do |phrase|
        val = check_line_for_dupes(phrase)
        count += val
      end
    end
    return count
  end

  # handles part one
  def run_no_anagram_check
    count = 0
    data = @dataset.split(/\n/)
    if data.respond_to?('each')
      data.each do |phrase|
        val = check_line_for_anagrams(phrase)
        count += val
      end
    end
    return count
  end
end

data = File.read('./inputs/day_04.txt')
# Part one check
p Validator.new(data).run_dupe_word_check

# Part two check
p Validator.new(data).run_no_anagram_check
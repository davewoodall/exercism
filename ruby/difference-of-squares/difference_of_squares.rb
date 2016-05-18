# NOTES
# Getting some practice with inject.
# Inject has a special syntax that lets you take every
# item in an array and add, subtract, multiply, etc.
# pretty cool.
# I had the pleasure of attending Ruby Conf in 2015 and saw this talk by Michael Hartl expliaining #inject, #collect, #select, #reject, and other enumerables. Worth watching and coding along...
# https://www.youtube.com/watch?v=y4V9qVTkj3c

class Squares
  VERSION = 2

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def square_of_sum
    (1..number).inject(:+) ** 2
  end

  def sum_of_squares
    (1..number).map { |n| n ** 2 }.inject(:+)
  end

  def difference
    return 0 if number == 0
    square_of_sum - sum_of_squares
  end
end

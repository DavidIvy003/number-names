#!/usr/bin/env bundle exec ruby

require 'colorize'

class NumberNames
  attr_accessor :number

  NUMBER_NAMES = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine' }

  def initialize(number)
    begin
      @number = Integer(number)
    rescue
      raise InvalidInput
    end
  end

  def name
    NUMBER_NAMES[@number]
  end
end

class InvalidInput < Exception; end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  puts NumberNames.new
end

#!/usr/bin/env bundle exec ruby

require 'colorize'

class NumberNames
  attr_accessor :number

  NUMBER_NAMES = { 0 => 'zero',
                   1 => 'one',
                   2 => 'two',
                   3 => 'three',
                   4 => 'four',
                   5 => 'five',
                   6 => 'six',
                   7 => 'seven',
                   8 => 'eight',
                   9 => 'nine',
                  10 => 'ten',
                  11 => 'eleven',
                  12 => 'twelve',
                  13 => 'thirteen',
                  14 => 'fourteen',
                  15 => 'fifteen',
                  16 => 'sixteen',
                  17 => 'seventeen',
                  18 => 'eighteen',
                  19 => 'nineteen',
                  20 => 'twenty',

                    }

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

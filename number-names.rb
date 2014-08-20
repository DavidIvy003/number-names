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
                  30 => 'thirty',
                  40 => 'forty',
                  50 => 'fifty',
                  60 => 'sixty',
                  70 => 'seventy',
                  80 => 'eighty',
                  90 => 'ninety'
                }

  def initialize(number)
    begin
      @number = Integer(number)
    rescue
      raise InvalidInput
    end
  end

  def name
    if NUMBER_NAMES.include? number
      NUMBER_NAMES[number]
    else
      "#{NUMBER_NAMES[tens_digit * 10]}-#{NUMBER_NAMES[ones_digit]}"
    end
  end

  private
    def tens_digit
      number / 10
    end

    def ones_digit
      number % 10
    end
end

class InvalidInput < Exception; end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  puts NumberNames.new
end

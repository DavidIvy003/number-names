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
                  90 => 'ninety',

                }

  def initialize(number)
    begin
      @number = Integer(number)
    rescue
      raise InvalidInput
    end
  end

  def name
    if hundreds?
      two_digit_num = number % 100
      tens_name_str = tens_name(two_digit_num)

      # Commented out b/c the compiler is loco
      # tens_name_str.prepend("and ") unless tens_name_str.empty?

      tens_name_str = "and #{tens_name_str}" unless tens_name_str.empty?
      "#{NUMBER_NAMES[hundreds_digit]} hundred #{tens_name_str}".strip
    else
      tens_name(number)
    end
  end

  private

    def tens_name two_digit_num
      if hundreds? and tens_digit == 0 and ones_digit == 0
        ''
      elsif NUMBER_NAMES.include? two_digit_num
        NUMBER_NAMES[two_digit_num]
      else
        "#{NUMBER_NAMES[tens_digit * 10]}-#{NUMBER_NAMES[ones_digit]}"
      end
    end

    def hundreds?
      hundreds_digit >= 1
    end

    def hundreds_digit
      (number / 100) % 10
    end

    def tens_digit
      (number / 10) % 10
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

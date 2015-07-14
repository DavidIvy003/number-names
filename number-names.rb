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

  PLACE_NAMES = {
    1000 => 'thousand',
    1000000 => 'million',
    1000000000 => 'billion',
    1000000000000 => 'trillion',
    1000000000000000 => 'quadrillion',
    1000000000000000000 => 'quintillion',
    1000000000000000000000 => 'sextillion',
    1000000000000000000000000 => 'septillion',
    1000000000000000000000000000 => 'octillion',
    1000000000000000000000000000000 => 'nonillion',
    1000000000000000000000000000000000 => 'decillion'
  }

  def initialize(number)
    begin
      @number = Integer(number)
    rescue
      raise InvalidInput
    end
  end

  def name number=@number

    first_digits       = front_digits number
    first_digits_name  = hundreds_name first_digits
    current_place_name = place_name(number)

    next_number = digits_after(number, first_digits.to_s.length)
    next_name = ''
    next_name = name(next_number)  if next_number > 0
    next_name = "and #{next_name}" if next_number < 10 and !next_name.empty?

    "#{first_digits_name} #{current_place_name} #{next_name}".strip
  end

  private
    def front_digits number
      # Returns digits at front of number that are rounded up to three
      # Example front_digits(12334563) returns 12
      while(thousands? number)
        number = number / 1000
      end
      number
    end

    def digits_after number, n_digits
      # Returns digits from number after the first n digits
      number.to_s.slice(n_digits..-1).to_i
    end

    def place_name number
      # Returns name of current digit place: 'thousand', 'million', ex
      current_place = ''
      PLACE_NAMES.each do |idx, val|
        current_place = val if number >= idx
      end
      current_place
    end

    def hundreds_name number
      if hundreds?(number)
        two_digit_num = number % 100
        tens_name_str = tens_name(two_digit_num)

        tens_name_str = "and #{tens_name_str}" unless tens_name_str.empty?
        "#{NUMBER_NAMES[hundreds_digit(number)]} hundred #{tens_name_str}".strip
      elsif tens?(number)
        tens_name(number)
      else
        ones_name(number)
      end
    end

    def ones_name(number)
      "#{NUMBER_NAMES[number]}"
    end

    def tens_name two_digit_num
      if two_digit_num == 0
        ''
      elsif NUMBER_NAMES.include? two_digit_num
        NUMBER_NAMES[two_digit_num]
      else
        "#{NUMBER_NAMES[tens_digit(two_digit_num) * 10]}-#{NUMBER_NAMES[ones_digit(two_digit_num)]}"
      end
    end

    def thousands? number=@number
      thousands_digits(number) >= 1
    end

    def thousands_digits number=@number
      number / 1000
    end

    def hundreds? number=@number
      hundreds_digit(number) >= 1
    end

    def hundreds_digit number=@number
      (number / 100) % 10
    end

    def tens? number=@number
      tens_digit(number) >= 1
    end

    def tens_digit number=@number
      (number / 10) % 10
    end

    def ones_digit number=@number
      number % 10
    end
end

class InvalidInput < Exception; end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  puts NumberNames.new( ARGV[0] ).name
end

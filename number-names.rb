#!/usr/bin/env bundle exec ruby

require 'colorize'

class NumberNames
  attr_accessor :number
  def initialize(number)
    begin
      @number = Integer(number)
    rescue
      raise InvalidInput
    end

  end
end

class InvalidInput < Exception; end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  puts NumberNames.new
end

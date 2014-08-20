#!/usr/bin/env bundle exec ruby

require 'colorize'

class Kata
end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  puts Kata.new
end

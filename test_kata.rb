require 'simplecov'
require 'turn/autorun'
require 'colorize'

SimpleCov.start do
  add_filter 'vendor'
end

require './kata'

describe Kata do
  it "can initialize itself" do
    kata = Kata.new
    kata.class.must_equal Kata
  end
end
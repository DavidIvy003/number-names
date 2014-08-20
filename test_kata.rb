require 'simplecov'
require 'turn/autorun'
require 'colorize'

SimpleCov.start do
  add_filter 'vendor'
end

require './number-names'

describe NumberNames do
  it "accepts a number as input" do
    nn = NumberNames.new(123)
    nn.number.must_equal 123
  end

  it "throws error if input is not an integer" do
    proc { NumberNames.new('abc') }.must_raise InvalidInput
    proc { NumberNames.new('2.5') }.must_raise InvalidInput
    proc { NumberNames.new(';') }.must_raise InvalidInput
    proc { NumberNames.new(:xyz) }.must_raise InvalidInput
  end
end
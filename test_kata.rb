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

  it "can say single digit numbers" do
    NumberNames.new('0').name.must_equal 'zero'
    NumberNames.new('1').name.must_equal 'one'
    NumberNames.new('2').name.must_equal 'two'
    NumberNames.new('3').name.must_equal 'three'
    NumberNames.new('4').name.must_equal 'four'
    NumberNames.new('5').name.must_equal 'five'
    NumberNames.new('6').name.must_equal 'six'
    NumberNames.new('7').name.must_equal 'seven'
    NumberNames.new('8').name.must_equal 'eight'
    NumberNames.new('9').name.must_equal 'nine'
  end

  it "can say numbers less than 21" do
    NumberNames.new('10').name.must_equal 'ten'
    NumberNames.new('11').name.must_equal 'eleven'
    NumberNames.new('12').name.must_equal 'twelve'
    NumberNames.new('13').name.must_equal 'thirteen'
    NumberNames.new('14').name.must_equal 'fourteen'
    NumberNames.new('15').name.must_equal 'fifteen'
    NumberNames.new('16').name.must_equal 'sixteen'
    NumberNames.new('17').name.must_equal 'seventeen'
    NumberNames.new('18').name.must_equal 'eighteen'
    NumberNames.new('19').name.must_equal 'nineteen'
    NumberNames.new('20').name.must_equal 'twenty'
  end

  it "can say numbers less than 100" do
    NumberNames.new('24').name.must_equal 'twenty-four'
    NumberNames.new('30').name.must_equal 'thirty'
    NumberNames.new('33').name.must_equal 'thirty-three'
    NumberNames.new('42').name.must_equal 'forty-two'
    NumberNames.new('57').name.must_equal 'fifty-seven'
    NumberNames.new('61').name.must_equal 'sixty-one'
    NumberNames.new('75').name.must_equal 'seventy-five'
    NumberNames.new('88').name.must_equal 'eighty-eight'
    NumberNames.new('99').name.must_equal 'ninety-nine'
    NumberNames.new('96').name.must_equal 'ninety-six'
  end

  it "can say numbers round hundreds" do
    NumberNames.new('100').name.must_equal 'one hundred'
    NumberNames.new('200').name.must_equal 'two hundred'
    NumberNames.new('300').name.must_equal 'three hundred'
    NumberNames.new('400').name.must_equal 'four hundred'
    NumberNames.new('500').name.must_equal 'five hundred'
    NumberNames.new('600').name.must_equal 'six hundred'
    NumberNames.new('700').name.must_equal 'seven hundred'
    NumberNames.new('800').name.must_equal 'eight hundred'
    NumberNames.new('900').name.must_equal 'nine hundred'
  end
end
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

  it "can say any three-digit number" do
    NumberNames.new('107').name.must_equal 'one hundred and seven'
    NumberNames.new('111').name.must_equal 'one hundred and eleven'
    NumberNames.new('237').name.must_equal 'two hundred and thirty-seven'
    NumberNames.new('999').name.must_equal 'nine hundred and ninety-nine'
  end

  it "can say numbers round thousands" do
    NumberNames.new('1000').name.must_equal 'one thousand'
    NumberNames.new('2000').name.must_equal 'two thousand'
    NumberNames.new('3000').name.must_equal 'three thousand'
    NumberNames.new('4000').name.must_equal 'four thousand'
    NumberNames.new('5000').name.must_equal 'five thousand'
    NumberNames.new('6000').name.must_equal 'six thousand'
    NumberNames.new('7000').name.must_equal 'seven thousand'
    NumberNames.new('8000').name.must_equal 'eight thousand'
    NumberNames.new('9000').name.must_equal 'nine thousand'
  end

  it "can say any four-digit number" do
    NumberNames.new('1111').name.must_equal 'one thousand one hundred and eleven'
    NumberNames.new('1234').name.must_equal 'one thousand two hundred and thirty-four'
    NumberNames.new('2468').name.must_equal 'two thousand four hundred and sixty-eight'
    NumberNames.new('3690').name.must_equal 'three thousand six hundred and ninety'
    NumberNames.new('4001').name.must_equal 'four thousand and one'
    NumberNames.new('5999').name.must_equal 'five thousand nine hundred and ninety-nine'
    NumberNames.new('6543').name.must_equal 'six thousand five hundred and forty-three'
    NumberNames.new('7892').name.must_equal 'seven thousand eight hundred and ninety-two'
    NumberNames.new('8815').name.must_equal 'eight thousand eight hundred and fifteen'
    NumberNames.new('9999').name.must_equal 'nine thousand nine hundred and ninety-nine'
  end

  it "can say any six-digit number" do
    NumberNames.new('111111').name.must_equal 'one hundred and eleven thousand one hundred and eleven'
    NumberNames.new('123456').name.must_equal 'one hundred and twenty-three thousand four hundred and fifty-six'
    NumberNames.new('246810').name.must_equal 'two hundred and forty-six thousand eight hundred and ten'
    NumberNames.new('96430').name.must_equal 'ninety-six thousand four hundred and thirty'
    NumberNames.new('36000').name.must_equal 'thirty-six thousand'
  end

  it "can say numbers round millions" do
    NumberNames.new('1000000').name.must_equal 'one million'
    NumberNames.new('2000000').name.must_equal 'two million'
    NumberNames.new('3000000').name.must_equal 'three million'
    NumberNames.new('4000000').name.must_equal 'four million'
    NumberNames.new('5000000').name.must_equal 'five million'
    NumberNames.new('6000000').name.must_equal 'six million'
    NumberNames.new('7000000').name.must_equal 'seven million'
    NumberNames.new('8000000').name.must_equal 'eight million'
    NumberNames.new('9000000').name.must_equal 'nine million'
  end

  it "can say numbers any nine-digit number" do
    NumberNames.new('111000000').name.must_equal 'one hundred and eleven million'
    NumberNames.new('425000001').name.must_equal 'four hundred and twenty-five million and one'
    NumberNames.new('49001001').name.must_equal 'forty-nine million one thousand and one'
    NumberNames.new('67045000').name.must_equal 'sixty-seven million forty-five thousand'
    NumberNames.new('367145999').name.must_equal 'three hundred and sixty-seven million one hundred and forty-five thousand nine hundred and ninety-nine'
  end

  it "can say ten-digit numbers" do
    NumberNames.new('1000000000').name.must_equal 'one billion'
    NumberNames.new('2000000000').name.must_equal 'two billion'
    NumberNames.new('3000000000').name.must_equal 'three billion'
    NumberNames.new('4000000000').name.must_equal 'four billion'
    NumberNames.new('5000000000').name.must_equal 'five billion'
    NumberNames.new('6000000000').name.must_equal 'six billion'
    NumberNames.new('7000000000').name.must_equal 'seven billion'
    NumberNames.new('8000000000').name.must_equal 'eight billion'
    NumberNames.new('9999999999').name.must_equal 'nine billion nine hundred and ninety-nine million nine hundred and ninety-nine thousand nine hundred and ninety-nine'
  end
end

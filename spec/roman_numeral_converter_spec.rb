require 'spec_helper'
require_relative '../roman_numeral_converter'

describe RomanNumeralConverter do
  before :each do
    @roman_numeral_converter = RomanNumeralConverter.new
  end

  it 'should return a roman numberal converter class' do
    expect(@roman_numeral_converter.class).to eql(RomanNumeralConverter)
  end

  it 'should return an error when given an invalid character' do
    expect { @roman_numeral_converter.convert('XB')}.to raise_error('Invalid character. Please try again.')
  end

  it 'should return an error when given a weird roman numeral' do
    expect{@roman_numeral_converter.convert('IIII')}.to raise_error('Invalid character. Please try again.')
  end

  it 'should return the number 1 when I is inserted' do
    expect(@roman_numeral_converter.convert('I')).to eql(1)
  end

  it 'should return the number 2 when II is inserted' do
    expect(@roman_numeral_converter.convert('II')).to eql(2)
  end

  it 'should return the number 4 when IV is inserted' do
    expect(@roman_numeral_converter.convert('IV')).to eql(4)
  end

  it 'should return the number 9 when IX is inserted' do
    expect(@roman_numeral_converter.convert('IX')).to eql(9)
  end

  it 'should return the number 5 when V is inserted' do
    expect(@roman_numeral_converter.convert('V')).to eql(5)
  end

  it 'should return the number 10 when X is inserted' do
    expect(@roman_numeral_converter.convert('X')).to eql(10)
  end

  it 'should return the number 40 when XL is inserted' do
    expect(@roman_numeral_converter.convert('XL')).to eql(40)
  end

  it 'should return the number 90 when XC is inserted' do
    expect(@roman_numeral_converter.convert('XC')).to eql(90)
  end

  it 'should return the number 50 when L is inserted' do
    expect(@roman_numeral_converter.convert('L')).to eql(50)
  end

  it 'should return the number 100 when C is inserted' do
    expect(@roman_numeral_converter.convert('C')).to eql(100)
  end

  it 'should return the number 400 when CD is inserted' do
    expect(@roman_numeral_converter.convert('CD')).to eql(400)
  end

  it 'should return the number 900 when CM is inserted' do
    expect(@roman_numeral_converter.convert('CM')).to eql(900)
  end

  it 'should return the number 500 when D is inserted' do
    expect(@roman_numeral_converter.convert('D')).to eql(500)
  end

  it 'should return the number 1000 when M is inserted' do
    expect(@roman_numeral_converter.convert('M')).to eql(1000)
  end

  describe 'Required tests' do
    it 'should return the number 4 when IV is inserted' do
      expect(@roman_numeral_converter.convert('IV')).to eql(4)
    end

    it 'should return the number 34 when XXXIV is inserted' do
      expect(@roman_numeral_converter.convert('XXXIV')).to eql(34)
    end

    it 'should return the number 267 when CCLXVII is inserted' do
      expect(@roman_numeral_converter.convert('CCLXVII')).to eql(267)
    end

    it 'should return the number 764 when DCCLXIV is inserted' do
      expect(@roman_numeral_converter.convert('DCCLXIV')).to eql(764)
    end

    it 'should return the number 987 when CMLXXXVII is inserted' do
      expect(@roman_numeral_converter.convert('CMLXXXVII')).to eql(987)
    end

    it 'should return the number 1983 when MCMLXXXIII is inserted' do
      expect(@roman_numeral_converter.convert('MCMLXXXIII')).to eql(1983)
    end

    it 'should return the number 2014 when MMXIV is inserted' do
      expect(@roman_numeral_converter.convert('MMXIV')).to eql(2014)
    end

    it 'should return the number 4000 when MMMM is inserted' do
      expect(@roman_numeral_converter.convert('MMMM')).to eql(4000)
    end

    it 'should return the number 4999 when MMMMCMXCIX is inserted' do
      expect(@roman_numeral_converter.convert('MMMMCMXCIX')).to eql(4999)
    end

    # IV = 4
    # XXXIV = 34
    # CCLXVII = 267
    # DCCLXIV = 764
    # CMLXXXVII = 987
    # MCMLXXXIII = 1983
    # MMXIV = 2014
    # MMMM = 4000
    # MMMMCMXCIX = 4999
  end
end
require 'spec_helper'
require_relative '../roman_numeral'


describe RomanNumeral do
  before :each do
    @rn = RomanNumeral.new('X', 10)
  end

  it 'should load up a new RomanNumeral Object' do
    expect {@rm}.to_not raise_error
  end

  it 'returns false when not given the correct roman numeral' do
    rn = RomanNumeral.new('IV', 4)
    expect(rn.match('XIV')).to eql(false)
  end

  it 'returns true when given the correct roman numeral' do
    rn = RomanNumeral.new('IV', 4)
    expect(rn.match('IV')).to eql(true)
  end

  it 'returns true when give a single roman numeral' do
    expect(@rn.match('X')).to eql(true)
  end

  it 'should return a list of roman numerals with correct data' do
    expect(RomanNumeral.list.first.letter).to eql('CM')
  end

  it 'should return 1 when the length of a roman numeral is one' do
    expect(@rn.length).to eql(1)
  end

end
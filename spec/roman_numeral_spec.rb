require 'spec_helper'
require_relative '../roman_numeral'

describe RomanNumeral do
  before :each do
    @rn = RomanNumeral.new('X', 10)
  end

  describe 'validation' do
    context 'for thousands' do
      it 'should be valid if M is given' do
        expect { RomanNumeral.validate_number('M') }.to_not raise_error
      end

      it 'should be valid if MM is given' do
        expect { RomanNumeral.validate_number('MM') }.to_not raise_error
      end

      it 'should be valid if MMM is given' do
        expect { RomanNumeral.validate_number('MMM') }.to_not raise_error
      end

      it 'should be valid if MMMM is given' do
        expect { RomanNumeral.validate_number('MMMM') }.to_not raise_error
      end

      it 'should not be valid if MMMMM is given' do
        expect { RomanNumeral.validate_number('MMMMM') }.to raise_error('Invalid character. Please try again.')
      end
    end

    context 'for hundreds' do
      it 'should be valid if C is given' do
        expect { RomanNumeral.validate_number('C') }.to_not raise_error
      end

      it 'should be valid if CC is given' do
        expect { RomanNumeral.validate_number('CC') }.to_not raise_error
      end

      it 'should be valid if CCC is given' do
        expect { RomanNumeral.validate_number('CCC') }.to_not raise_error
      end

      it 'should not be valid if CCCC is given' do
        expect { RomanNumeral.validate_number('CCCC') }.to raise_error
      end

      it 'should be valid if CD is given' do
        expect { RomanNumeral.validate_number('CD') }.to_not raise_error
      end

      it 'should be valid if CM is given' do
        expect { RomanNumeral.validate_number('CM') }.to_not raise_error
      end
    end

    context 'for five hundreds' do
      it 'should be valid if D is given' do
        expect { RomanNumeral.validate_number('D') }.to_not raise_error
      end

      it 'should not be valid if DD is given' do
        expect { RomanNumeral.validate_number('DD') }.to raise_error
      end
    end

    context 'for fifties' do
      it 'should be valid if L is given' do
        expect { RomanNumeral.validate_number('L') }.to_not raise_error
      end

      it 'should not be valid if LL is given' do
        expect { RomanNumeral.validate_number('LL') }.to raise_error
      end
    end

    context 'for tens' do
      it 'should be valid if X is given' do
        expect { RomanNumeral.validate_number('X') }.to_not raise_error
      end

      it 'should be valid if XX is given' do
        expect { RomanNumeral.validate_number('XX') }.to_not raise_error
      end

      it 'should be valid if XXX is given' do
        expect { RomanNumeral.validate_number('XXX') }.to_not raise_error
      end

      it 'should not be valid if XXXX is given' do
        expect { RomanNumeral.validate_number('XXXX') }.to raise_error
      end

      it 'should be valid if XC is given' do
        expect { RomanNumeral.validate_number('XC') }.to_not raise_error
      end

      it 'should be valid if XL is given' do
        expect { RomanNumeral.validate_number('XL') }.to_not raise_error
      end
    end

    context 'for fives' do
      it 'should be valid if V is given' do
        expect { RomanNumeral.validate_number('V') }.to_not raise_error
      end

      it 'should not be valid if VV is given' do
        expect { RomanNumeral.validate_number('VV') }.to raise_error
      end
    end

    context 'for ones' do
      it 'should be valid if I is given' do
        expect { RomanNumeral.validate_number('I') }.to_not raise_error
      end

      it 'should be valid if II is given' do
        expect { RomanNumeral.validate_number('II') }.to_not raise_error
      end

      it 'should be valid if III is given' do
        expect { RomanNumeral.validate_number('III') }.to_not raise_error
      end

      it 'should be valid if IIII is given' do
        expect { RomanNumeral.validate_number('IIII') }.to raise_error
      end

      it 'should be valid if IV is given' do
        expect { RomanNumeral.validate_number('IV') }.to_not raise_error
      end

      it 'should be valid if IX is given' do
        expect { RomanNumeral.validate_number('IX') }.to_not raise_error
      end
    end

    context 'for greater than 5000' do
      it 'should be valid if (M) is given' do
        expect { RomanNumeral.validate_number('(M)') }.to_not raise_error
      end

      it 'should be valid if (D) is given' do
        expect { RomanNumeral.validate_number('(D)') }.to_not raise_error
      end

      it 'should be valid if (C) is given' do
        expect { RomanNumeral.validate_number('(C)') }.to_not raise_error
      end

      it 'should be valid if (L) is given' do
        expect { RomanNumeral.validate_number('(L)') }.to_not raise_error
      end

      it 'should be valid if (X) is given' do
        expect { RomanNumeral.validate_number('(X)') }.to_not raise_error
      end
    end
  end

  it 'loads up a new RomanNumeral Object' do
    expect {@rm}.to_not raise_error
  end

  it 'returns a list of roman numerals with correct data' do
    RomanNumeral.list.each do |roman_numeral|
      expect(roman_numeral.class).to eql(RomanNumeral)
    end
  end

  it 'returns 1 when the length of a roman numeral is one' do
    expect(@rn.length).to eql(1)
  end

  it 'returns 2 when the length of a roman numeral is two' do
    expect(RomanNumeral.new('IX', 9).length).to eql(2)
  end

  it 'removes the parenthesis of a given character' do
    expect(RomanNumeral.remove_parenthesis('(M)')).to eql('M')
  end

  it 'matches between two different Roman Numeral objects' do
    first = RomanNumeral.new('I', 1)
    second = RomanNumeral.new('I', 1)

    expect(first).to eql(second)
  end

  describe 'get' do
    it 'should return a I roman numeral' do
      rn = RomanNumeral.new('I', 1)
      expect(RomanNumeral.get('I')).to match_array([rn])
    end

    it 'returns a IX roman numeral' do
      nine = RomanNumeral.new('IX', 9)
      expect(RomanNumeral.get('IX')).to match_array([nine])
    end

    it 'should return two roman numeral Objects' do
      ten = RomanNumeral.new('X', 10)
      one = RomanNumeral.new('I', 1)

      expect(RomanNumeral.get('XI')).to match_array([one, ten])
    end

    it 'returns a combination of roman numeral objects' do
      forty = RomanNumeral.new('XL', 40)
      five = RomanNumeral.new('V', 5)
      one = RomanNumeral.new('I', 1)

      expect(RomanNumeral.get('XLVIII')).to match_array([forty, one, five, one, one,])
    end
  end
end
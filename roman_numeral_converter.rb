class RomanNumeralConverter
  require_relative 'roman_numeral'

  def convert(character)
    roman_numerals = character.upcase
    RomanNumeral.validate_number(roman_numerals)

    if RomanNumeral.greater_than_5000_regexp.match(roman_numerals)
      big_roman_numerals = RomanNumeral.remove_parenthesis(roman_numerals.slice!(RomanNumeral.greater_than_5000_regexp))
    end

    number = to_integer(roman_numerals)
    if big_roman_numerals
      number += to_integer(big_roman_numerals) * 1000
    end
    number
  end

  private

  def to_integer(roman_numerals)
    RomanNumeral.from(roman_numerals).inject(0){|sum, roman_numeral| sum + roman_numeral.amount}
  end
end
class RomanNumeralConverter
  require_relative 'roman_numeral'

  def convert(character)
    RomanNumeral.validate_number(character)
    roman_numerals = character.upcase

    if RomanNumeral.greater_than_5000_regexp.match(roman_numerals)
      big_roman_numerals = RomanNumeral.remove_parenthesis(roman_numerals.slice!(RomanNumeral.greater_than_5000_regexp))
    end

    number = get_roman_numeral(roman_numerals)
    if big_roman_numerals
      number += get_roman_numeral(big_roman_numerals) * 1000
    end
    number
  end

  private

  def get_roman_numeral(roman_numerals)
    RomanNumeral.get(roman_numerals).inject(0){|sum, roman_numeral| sum + roman_numeral.amount}
  end
end
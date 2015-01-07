class RomanNumeralConverter
  require_relative 'roman_numeral'

  def convert(character)
    validate_number(character)
    roman_numerals = character.upcase

    if RomanNumeral.greater_than_5000_regexp.match(character)
      big_roman_numerals = remove_parenthesis(roman_numerals.slice!(RomanNumeral.greater_than_5000_regexp))
    end

    number = get_roman_numeral(roman_numerals)
    if big_roman_numerals
      number += get_roman_numeral(big_roman_numerals) * 1000
    end
    number
  end

  def get_roman_numeral(roman_numerals)
    total = 0
    until roman_numerals.empty?
      RomanNumeral.list.each do |roman_numeral|
        if roman_numerals.start_with?(roman_numeral.letter)
          total += roman_numeral.amount
          roman_numerals.slice!(0, roman_numeral.length)
          break
        end
      end
    end
    total
  end

  private

  def validate_number(number)
    raise 'Invalid character. Please try again.' unless RomanNumeral.regexp.match(number) || RomanNumeral.greater_than_5000_regexp.match(number)
  end

  def remove_parenthesis(characters)
    characters.gsub(/\(|\)/, '')
  end
end
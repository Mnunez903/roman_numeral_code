class RomanNumeralConverter
  ROMAN_NUMERAL_REGEXP = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
  ROMAN_NUMERAL_GREATER_THAN_5000_REGEXP =/\(.*?\)/
  NUMERALS = {I: 1,
              IV: 4,
              IX: 9,
              V: 5,
              X: 10,
              XL: 40,
              XC: 90,
              L: 50,
              C: 100,
              CD: 400,
              CM: 900,
              D: 500,
              M: 1000}

  def convert(character)
    validate_number(character)
    roman_numerals = character.upcase

    if ROMAN_NUMERAL_GREATER_THAN_5000_REGEXP.match(character)
      big_roman_numerals = return_characters_in_parenthesis(roman_numerals.slice!(ROMAN_NUMERAL_GREATER_THAN_5000_REGEXP))
    end

    number = get_roman_numeral(roman_numerals)
    if big_roman_numerals
      number += get_roman_numeral(big_roman_numerals) * 1000
    end
    number
  end

  def get_roman_numeral(roman_numerals)
    total = 0
    keys = NUMERALS.keys.sort_by(&:length).reverse
    while roman_numerals.length != 0
      keys.each do |key|
        if roman_numerals.start_with?(key.to_s)
          total += NUMERALS[key]
          roman_numerals.slice!(0, key.length)
          break
        end
      end
    end
    total
  end

  private

  def validate_number(number)
    raise 'Invalid character. Please try again.' unless ROMAN_NUMERAL_REGEXP.match(number) || ROMAN_NUMERAL_GREATER_THAN_5000_REGEXP.match(number)
  end

  def add_value_from_numerals(roman_numeral)
    NUMERALS[roman_numeral.to_sym]
  end

  def return_characters_in_parenthesis(characters)
    characters.gsub(/\(|\)/, '')
  end
end
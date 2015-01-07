class RomanNumeralConverter
  ROMAN_NUMERAL_REGEXP = /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
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

  ONE_CHARACTER = 1

  TWO_CHARACTERS = 2

  def convert(character)
    validate_number(character)
    roman_numerals = character.upcase
    number = 0

    while roman_numerals.length != 0
      case
        when roman_numerals.start_with?('IV')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('IX')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('I')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('XL')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('XC')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('X')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('V')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('L')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('CD')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('CM')
          value = NUMERALS[roman_numerals.slice!(0,TWO_CHARACTERS).to_sym]
        when roman_numerals.start_with?('C')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('D')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        when roman_numerals.start_with?('M')
          value = NUMERALS[roman_numerals.slice!(0,ONE_CHARACTER).to_sym]
        else
      end
      number += value
    end
    number
  end

  private

  def validate_number(number)
    raise 'Invalid character. Please try again.' unless ROMAN_NUMERAL_REGEXP.match(number)
  end

  def add_value_from_numerals(roman_numeral)
    NUMERALS[roman_numeral.to_sym]
  end
end



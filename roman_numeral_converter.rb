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

  def convert(character)
    validate_number(character)
    roman_numeral = character.upcase
    number = 0

    while roman_numeral.length != 0
      case
        when roman_numeral.start_with?('IV')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('IX')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('I')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('XL')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('XC')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('X')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('V')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('L')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('CD')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('CM')
          value = NUMERALS[roman_numeral.slice!(0,2).to_sym]
        when roman_numeral.start_with?('C')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('D')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        when roman_numeral.start_with?('M')
          value = NUMERALS[roman_numeral.slice!(0,1).to_sym]
        else
          raise 'Invalid character. Please try again.'
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



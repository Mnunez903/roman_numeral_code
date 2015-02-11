class RomanNumeral
  attr_reader :letter, :amount

  def initialize(letter, amount)
    @letter = letter
    @amount = amount
  end

  def self.list
    @list ||= ROMAN_NUMERAL_HASH.map {|key, value| self.new(key, value)}
  end

  def self.validate_number(number)
    raise 'Invalid character. Please try again.' unless roman_numeral_regexp.match(number) || greater_than_5000_regexp.match(number)
  end

  def self.remove_parenthesis(characters)
    characters.gsub(parenthesis_regexp, '')
  end

  def self.from(characters)
    list.flat_map do |roman_numeral|
      find_roman_numeral(characters, roman_numeral).collect do |roman_numeral_letter|
        remove_roman_numeral(characters, roman_numeral_letter)
        roman_numeral
      end
    end
  end

  def ==(object)
    self.amount == object.amount && self.letter == object.letter
  end

  def eql?(object)
    self == object
  end

  def length
    @letter.length
  end

  private

  def self.find_roman_numeral(character, roman_numeral)
    character.scan(roman_numeral.letter)
  end

  def self.remove_roman_numeral(character, s)
    character.slice!(s)
  end

  def self.roman_numeral_regexp
    /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
  end

  def self.greater_than_5000_regexp
    /\(.*?\)/
  end

  def self.parenthesis_regexp
    /\(|\)/
  end

  ROMAN_NUMERAL_HASH=
      {
          'CM' => 900,
          'CD' => 400,
          'XC' => 90,
          'XL' => 40,
          'IV' => 4,
          'IX' => 9,
          'M' => 1000,
          'D' => 500,
          'C' => 100,
          'L' => 50,
          'X' => 10,
          'V' => 5,
          'I' => 1
      }
end
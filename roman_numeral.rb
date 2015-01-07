class RomanNumeral
  attr_reader :letter, :amount

  def initialize(letter, amount)
    @letter = letter
    @amount = amount
  end

  def self.regexp
    /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/
  end

  def self.greater_than_5000_regexp
    /\(.*?\)/
  end

  def self.list
    @list ||= ROMAN_NUMERAL_HASH.map {|key, value| self.new(key, value)}
  end

  def self.get_value(key)
    ROMAN_NUMERAL_HASH[key]
  end

  def match(value)
    @letter.include?(value.slice(0, length))
  end

  def length
    @letter.length
  end

  private

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
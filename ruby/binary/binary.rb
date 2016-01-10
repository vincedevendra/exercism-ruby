class Binary
  VERSION = 1
  
  def initialize(binary_string)
    @binary_string = binary_string
    raise ArgumentError, "Not a valid binary number" unless valid_input?
  end

  def to_decimal
    binary_string.reverse.chars.map.with_index do |char, i|
      char.to_i * (2 ** i)
    end.reduce(:+)
  end

  private

  attr_reader :binary_string

  def valid_input?
    !(binary_string =~ /[^0-1]/)
  end
end

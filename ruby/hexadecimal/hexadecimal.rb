class Hexadecimal
  CONVERSION_TABLE = begin
    hash = (0..9).each_with_object({}) { |i, a| a[i.to_s] = i }
    ('a'..'f').each_with_object(hash).with_index { |(l, a), i| a[l] = i + 10 }
  end

  def initialize(number)
    @number = number
  end

  def to_decimal
    @number.chars.reverse.map.with_index do |char, i|
      value = CONVERSION_TABLE.fetch(char) { return 0 }
      value * 16**i
    end.reduce(:+)
  end
end

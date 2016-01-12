class Trinary
  INVALID = 0

  def initialize(num_string)
    @num_string = num_string
  end

  def to_decimal
    return INVALID if @num_string =~ /\D/

    result = 0

    @num_string.chars.reverse.each_with_index do |char, i|
      result += char.to_i * 3**i
    end

    result
  end
end

class Say
  DIGITS =  %w(zero one two three four five six seven eight nine ten eleven
               twelve thirteen)
  TENS = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
           6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }
  PLACES = ["", "thousand", "million", "billion"]

  def initialize(number)
    raise ArgumentError if number < 0 || number >= 10**12
    @number = number
  end

  def in_english
    return DIGITS[@number] if @number <= 13 
    @number < 1000 ? up_to_999(@number) : above_999(@number)
  end

  private

  def up_to_100(number)
    return "" if number == 0
    return DIGITS[number] if number <= 13

    array = to_a(number)

    return DIGITS[array.last] + "teen" if (14..19).cover?(number)
    return TENS[array.first] if array.last == 0
    "#{TENS[array[0]]}-#{DIGITS[array[1]]}"
  end

  def up_to_999(number)
    return up_to_100(number) if number < 100
    array = to_a(number)
    last_two = array.last(2).join.to_i
    "#{DIGITS[array[0]]} hundred #{up_to_100(last_two)}".strip
  end

  def above_999(number)
    reverse_digit_groups.map.with_index do |slice, i|
      number = to_i(slice)
      number == 0 ? next : "#{up_to_999(number)} #{PLACES[i]}".strip
    end.compact.reverse.join(" ")
  end

  def to_a(number)
    number.to_s.chars.map(&:to_i)
  end

  def to_i(array)
    array.join.to_i
  end

  def reverse_digit_groups
    to_a(@number).reverse.each_slice(3).map(&:reverse)
  end
end

class Series
  VERSION = 1

  def initialize(num_string)
    @num_string = num_string
  end

  def largest_product(length)
    return 1 if length == 0
    raise ArgumentError unless valid_num_string?(length)

    num_string
      .chars
      .each_cons(length)
      .map { |group| group.map(&:to_i).inject(:*) }
      .max
  end

  private

  attr_reader :num_string

  def valid_num_string?(length)
    length <= num_string.length && !(num_string =~ /\D/)
  end
end

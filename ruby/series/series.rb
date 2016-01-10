class Series
  def initialize(number_string)
    @number_string = number_string
  end

  def slices(slice_length)
    if @number_string.length < slice_length
      raise ArgumentError, "Slice length must be less than length of number"
    end
    @number_string.chars.map(&:to_i).each_cons(slice_length).to_a
  end
end

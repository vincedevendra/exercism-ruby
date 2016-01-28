class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string
    @matrix_array = to_a(matrix_string)
  end

  def rows
    @matrix_array 
  end

  def columns
    @columns ||= rows.transpose
  end

  private

  def to_a(matrix_string)
    @matrix_string.split("\n").map { |line| line.split(" ").map(&:to_i) }
  end
end

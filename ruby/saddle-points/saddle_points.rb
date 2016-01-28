class Matrix
  def initialize(matrix_string)
    @matrix_string = matrix_string
    @matrix_array =
      @matrix_string.split("\n").map { |line| line.split(" ").map(&:to_i) }
  end

  def rows
    @matrix_array
  end

  def columns
    rows.transpose
  end

  def saddle_points
    rows.each_with_index.with_object([]) do |(row, row_num), points|
      row.each_with_index do |num, col_num|
        next unless rows[row_num].max == num && columns[col_num].min == num
        points << [row_num, col_num]
      end
    end
  end
end

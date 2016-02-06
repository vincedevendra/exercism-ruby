class Triangle
  def initialize(row_count)
    @row_count = row_count
  end

  def rows
    @row_count.times.with_object([]) do |index, result|
      row = result[index] = Array.new(index + 1)
      row.map!.with_index do |_, i|
        next 1 if i == 0 || i == row.size - 1
        one_row_up = result[index - 1]
        one_row_up[i - 1] + result[index - 1][i]
      end
    end
  end
end

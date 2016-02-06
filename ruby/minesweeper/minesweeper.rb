class ValueError < StandardError; end

module Board
  def self.transform(input)
    raise ValueError unless valid?(input)

    input.map.with_index do |line, line_index|
      next line if first_or_last_line?(line_index, input)

      line.chars.each_with_index do |char, char_index|
        next unless char == " "
        set_char_to_mine_count(line, char_index, input, line_index)
      end

      line
    end
  end

  private

  def self.mine_count(line, char_index, input, line_index)
    positions_to_check(line, char_index, input, line_index).count do |char|
      char == "*"
    end
  end

  def self.set_char_to_mine_count(line, char_index, input, line_index)
    mine_count = mine_count(line, char_index, input, line_index).to_s
    line[char_index] = mine_count unless mine_count == '0' 
  end

  def self.valid?(input)
    input.all? { |line| line.size == input.first.size } &&
      !(input[0] =~ /\s/ || input[input.size - 1] =~ /\s/) &&
      input.none? { |line| line =~ /[^\+\|\- \*]/ }
  end

  def self.first_or_last_line?(line_index, input)
    line_index == 0 || line_index == input.size - 1
  end
   
  def self.positions_to_check(line, char_index, input, line_index)
    same_line_positions(line, char_index) + 
      above_and_below_positions(char_index, input, line_index)
  end

  def self.same_line_positions(line, char_index)
    [line[char_index - 1], line[char_index + 1]]
  end

  def self.above_and_below_positions(char_index, input, line_index)
    line_above = input[line_index - 1]
    line_below = input[line_index + 1]
    indexes = [char_index - 1, char_index, char_index + 1]

    [line_above, line_below].each_with_object([]) do |line, result|
      indexes.each { |index| result << line[index] }
    end
  end
end

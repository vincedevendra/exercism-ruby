class Integer
  ROM_NUMS = %w(I V X L C D M)
  PATTERN = [[0], [0, 0], [0, 0, 0], [0, 1], [1], [1, 0], [1, 0, 0],
             [1, 0, 0, 0], [0, 2]]

  def to_roman
    result = ''
    i = 0

    to_s.chars.map(&:to_i).reverse_each do |n|
      unless n == 0
        result.prepend(PATTERN[n - 1].map{ |index| ROM_NUMS[index + i] }.join)
      end
      i += 2
    end

    result
  end
end

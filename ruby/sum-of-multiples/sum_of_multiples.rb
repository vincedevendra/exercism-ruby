class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def self.to(limit, nums = [3, 5])
    return 0 unless nums.any? { |num| num < limit }
    nums.map { |num| multiples_of(num, limit) }.flatten.uniq.reduce(:+)
  end

  def to(limit)
    self.class.to(limit, @nums)
  end

  private

  def self.multiples_of(num, limit)
    multiples = []
    num > limit ? multiples : multiples << num
    i = num
    multiples << i while (i += num) < limit
    multiples
  end
end

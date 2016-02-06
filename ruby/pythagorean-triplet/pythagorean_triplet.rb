class Triplet
  attr_reader :sides, :hypotenuse, :legs

  def initialize(*args)
    args.flatten!
    raise ArgumentError unless args.length == 3
    @sides = args
    @hypotenuse = @sides.max
    @legs = @sides.min(2)
  end

  def sum
    sides.reduce(:+)
  end

  def product
    sides.reduce(:*)
  end

  def pythagorean?
    (hypotenuse**2) == sum_of_squares_of_legs
  end

  def self.where(min_factor: 1, max_factor:, sum: nil)
    triplets(min_factor, max_factor).select do |triplet|
      triplet.pythagorean? && (sum.nil? || triplet.sum == sum)
    end
  end

  private

  def sum_of_squares_of_legs
    legs.map { |leg| leg**2 }.reduce(:+)
  end

  def self.combos(min, max)
    (min..max).to_a.combination(3)
  end

  def self.triplets(min_factor, max_factor)
    combos(min_factor, max_factor).map { |combo| Triplet.new(combo) }
  end
end

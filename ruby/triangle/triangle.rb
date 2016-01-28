class TriangleError < StandardError; end

class Triangle
  def initialize(*sides)
    @sides = sides
  end

  def kind
    raise TriangleError if side_less_than_0? || inequality_violation?
    return :equilateral if @sides.uniq.size == 1 
    return :isosceles if @sides.uniq.size == 2
    :scalene
  end

  private

  def side_less_than_0?
    @sides.any? { |side| side <= 0 }
  end

  def inequality_violation?
    @sides.max >= @sides.min(2).reduce(:+)
  end
end

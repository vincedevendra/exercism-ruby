class Robot
  attr_reader :bearing, :coordinates

  VALID_BEARINGS = [:north, :east, :south, :west]

  def orient(bearing)
    raise ArgumentError unless VALID_BEARINGS.include?(bearing)
    @bearing = bearing
  end

  def turn_right
    set_bearing(:right)
  end

  def turn_left
    set_bearing(:left)
  end

  def at(x, y)
    @coordinates ||= [x, y]
  end

  def advance
    @coordinates[1] += 1 if bearing == :north
    @coordinates[1] -= 1 if bearing == :south
    @coordinates[0] += 1 if bearing == :east
    @coordinates[0] -= 1 if bearing == :west
  end

  private

  def set_bearing(direction)
    index = VALID_BEARINGS.index(bearing) - (direction == :right ? 3 : 1)
    @bearing = VALID_BEARINGS[index]
  end
end

class Simulator
  TRANSLATOR = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(instructions)
    instructions.split('').map { |instruction| TRANSLATOR.fetch(instruction) }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions)
    instructions(instructions).each { |instruction| robot.send(instruction) }
  end
end

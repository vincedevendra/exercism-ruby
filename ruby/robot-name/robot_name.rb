class Robot
  attr_reader :name

  def initialize
    @name = Robot.generate_name
  end

  def self.generate_name
    name = ''
    2.times { name << ('A'..'Z').to_a.sample }
    3.times { name << rand(10).to_s }
    name
  end

  def reset
    self.name = Robot.generate_name
  end
end

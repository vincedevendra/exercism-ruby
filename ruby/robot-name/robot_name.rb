class Robot
  attr_accessor :name

  def initialize
    @name = Robot.generate_name
  end

  def reset
    self.name = Robot.generate_name
  end

  private

  def self.generate_name
    name = ''
    2.times { name << ('A'..'Z').to_a.sample }
    3.times { name << rand(10).to_s }
    name
  end
end

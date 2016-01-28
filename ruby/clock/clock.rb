# without ruby time class
class Clock
  attr_reader :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    update_clock(:+, minutes)
  end

  def -(minutes)
    update_clock(:-, minutes)
  end

  def ==(other)
    other.minute == minute && other.hour == hour
  end

  private

  def update_clock(operation, minutes)
    hrs, mins = (@minute += minutes).divmod(60)
    hrs += 1 if @minute == 0 && operation == :-
    require 'pry'; binding.pry
    @minute = mins
    @hour = @hour.send(operation, hrs)
    correct_hours_over_24
    correct_negative_hours
    self
  end

  def correct_negative_minutes
    return if minute >= 0
    @minute *= -1
    @hour -= 1
  end

  def correct_negative_hours
    return if hour >= 0
    @hour += 24
  end

  def correct_hours_over_24
    return if hour < 24
    @hour -= 24
  end

#   def correct_minutes_over_60
#     return if minute < 60
#     @hour += 1
    # @minute -= 60
  # end
end

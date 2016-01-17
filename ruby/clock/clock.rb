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
    hours_to_add, minutes_to_add = minutes.divmod(60)
    @minute += minutes_to_add
    @hour += hours_to_add
    correct_hours_over_24
    correct_minutes_over_60
    self
  end

  def -(minutes)
    hours_to_subtract, minutes_to_subtract = minutes.divmod(60)
    @minute -= minutes_to_subtract
    @hour -= hours_to_subtract
    correct_negative_minutes
    correct_negative_hours
    self
  end

  def ==(other)
    other.minute == minute && other.hour == hour
  end

  private

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

  def correct_minutes_over_60
    return if minute < 60
    @hour += 1
    @minute -= 60
  end
end

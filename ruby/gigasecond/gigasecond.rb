require 'time'

class Gigasecond
  VERSION = 1.0

  def self.from(time)
    time + (10 ** 9)
  end
end

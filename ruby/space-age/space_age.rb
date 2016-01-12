class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31557600.0
  EARTH_YEARS = {on_mercury: 0.2408467, on_venus: 0.61519726,
                 on_mars: 1.8808158, on_jupiter: 11.862615, 
                 on_saturn: 29.447498, on_uranus: 84.016846,
                 on_neptune: 164.79312 }

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    @earth_years ||= seconds / EARTH_YEAR_IN_SECONDS
  end
  
  def method_missing(method)
    raise NoMethodError unless EARTH_YEARS.keys.include?(method)
    on_earth / EARTH_YEARS[method]
  end
end

class Acronym
  VERSION = 1 

  def self.abbreviate(given)
    acronym = given.scan(/[A-Z]|(?<=\s).|(?<=-)./).join.upcase
    acronym.length > 4 ? acronym[0..2] : acronym
  end
end

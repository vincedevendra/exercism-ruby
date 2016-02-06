class Atbash
  ALPHABET = ('a'..'z').to_a

  def self.encode(string)
    string.downcase.tr('a-z', 'z-a').chars.each_slice(5).map do |slice|
      slice.join
    end.join(' ')
  end
end

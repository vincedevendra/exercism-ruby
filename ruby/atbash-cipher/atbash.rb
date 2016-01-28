class Atbash
  ALPHABET = ('a'..'z').to_a

  def self.encode(string)
    encoded_array = encode_into_array(string)
    format(encoded_array)
  end

  private

  def self.encode_into_array(string)
    string.downcase.chars.map do |char|
      next if char =~ /\W/
      char =~ /[A-Za-z]/ ? encode_char(char) : char
    end.compact
  end

  def self.format(array)
    array.each_slice(5).reduce([]) do |result, slice|
      result << slice.join
    end.join(' ')
  end

  def self.encode_char(char)
    ALPHABET[(ALPHABET.length - 1) - ALPHABET.index(char)]
  end
end

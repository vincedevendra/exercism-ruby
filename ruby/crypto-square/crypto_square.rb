class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @plaintext ||= @text.gsub(/\W/, '').downcase
  end

  alias plaintext normalize_plaintext

  def size
    @size ||= begin
      size = Math.sqrt(plaintext.length)
      size.to_i == size ? size.to_i : (size.to_i + 1)
    end
  end

  def plaintext_segments
    @plaintext_segments ||= plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    cryptosquare.join
  end

  def normalize_ciphertext
    cryptosquare.join(' ')
  end

  private

  def cryptosquare
    @cryptosquare ||=
      plaintext_segments.each_with_object([]) do |segment, result|
        size.times do |i|
          char = segment[i]
          return result unless char
          result[i] ? result[i] << char : result[i] = char
        end
      end
  end
end

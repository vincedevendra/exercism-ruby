class Phrase
  VERSION = 1

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    split_words = @phrase.scan(/\w+'*\w+|\d/).map(&:downcase)

    split_words.uniq.each_with_object({}) do |word_key, result|
      result[word_key] = split_words.count { |word| word == word_key }
    end
  end
end

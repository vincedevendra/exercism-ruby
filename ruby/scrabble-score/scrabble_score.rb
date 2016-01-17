class Scrabble
  attr_reader :stripped_word, :word_bonus, :letter_bonus

  LETTER_VALUES = {
    ['A','E','I','O','U','L','N','R','S','T'] => 1,
    ['D','G'] => 2,
    ['B','C','M','P'] => 3,
    ['F','H','V','W','Y'] => 4,
    ['K'] => 5,
    ['J','X'] => 8,
    ['Q','Z'] => 10
  }

  def initialize(word, word_bonus = nil, letter_bonus = nil)
    @word = word
    @stripped_word = @word&.strip&.upcase
    @word_bonus = word_bonus
    @letter_bonus = letter_bonus&.each_with_object({}) do |(k, v), a|
      a[k.upcase] = v
    end
  end

  def score
    return 0 if stripped_word.nil? || stripped_word.empty?

    base_score = stripped_word
                  .scan(/./)
                  .map { |char| letter_score(char, letter_bonus) }
                  .reduce(:+)

    return base_score * 2 if word_bonus == :double_word
    return base_score * 3 if word_bonus == :triple_word
    base_score
  end

  def self.score(word, word_bonus = nil, letter_bonus = nil)
    new(word, word_bonus, letter_bonus).score
  end

  private

  def letter_score(letter, letter_bonus)
    value = LETTER_VALUES.find { |k, v| k.include?(letter) }[1]
    return value unless letter_bonus
    bonus = letter_bonus.delete(letter)
    return value * 2 if bonus == :double
    return value * 3 if bonus == :triple
    0
  end
end

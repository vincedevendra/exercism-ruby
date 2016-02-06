class PigLatin
  def self.translate(phrase)
    phrase.split.map do |word|
      next word + 'ay' if word =~ (/^[aeiou]|^[yx][^aeiou]/)
      match_data = word.match(/^s?[cst]hr?|^.?qu|./)
      first_letters = word.slice!(0..(match_data[0].length - 1))
      word + first_letters + 'ay'
    end.join(" ")
  end
end

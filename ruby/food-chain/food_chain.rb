class FoodChain
  VERSION = 2
  ANIMAL_SECOND_LINES = {
    'fly' => '',
    'spider' => "It wriggled and jiggled and tickled inside her.\n",
    'bird' => 'How absurd to swallow a',
    'cat' => 'Imagine that, to swallow a',
    'dog' => 'What a hog, to swallow a',
    'goat' => 'Just opened her throat and swallowed a',
    'cow' => "I don't know how she swallowed a",
   }

  ANIMALS = ANIMAL_SECOND_LINES.keys

  def self.song
    song = ''
    ANIMALS.each_with_index do |animal, index|
      song << stanza(animal, index)
    end
    song << final_stanza
    song
  end

  private

  def self.stanza(animal, index)
     stanza = ''
     stanza << first_stanza_line(animal)
     stanza << second_stanza_line(animal)
     index.downto(1) { |i| stanza << why_she_swallowed_it(i) }
     stanza << last_stanza_line
     stanza
  end

  def self.why_she_swallowed_it(index)
     animal_1 = ANIMALS[index]
     animal_2 = ANIMALS[index - 1]
     if animal_2 == 'spider' 
       animal_2 += ' that wriggled and jiggled and tickled inside her'
     end
    "She swallowed the #{animal_1} to catch the #{animal_2}.\n"
  end

  def self.first_stanza_line(animal)
    "I know an old lady who swallowed a #{animal}.\n"
  end

  def self.second_stanza_line(animal)
     return '' if animal == 'fly'
     return "#{ANIMAL_SECOND_LINES[animal]} #{animal}!\n" unless animal == 'spider'
     ANIMAL_SECOND_LINES[animal]
  end

  def self.last_stanza_line
    "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def self.final_stanza
    "#{first_stanza_line('horse')}She's dead, of course!\n"
  end
end


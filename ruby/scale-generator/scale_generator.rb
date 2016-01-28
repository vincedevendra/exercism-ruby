class Scale
  attr_reader :key, :mode

  FLAT_CHROMATIC_SCALE = %w(C Db D Eb E F Gb G Ab A Bb B)
  SHARP_CHROMATIC_SCALE = %w(C C# D D# E F F# G G# A A# B)
  FLAT_KEYS = %w(F Bb Eb Ab Db Gb Cb)
  INTERVALS = { major: [0, 2, 4, 5, 7, 9, 11],
                dorian: [0, 2, 3, 5, 7, 9, 10],
                phrygian: [0, 1, 3, 5, 7, 8, 10],
                lydian: [0, 2, 4, 6, 7, 9, 11],
                mixolydian: [0, 2, 4, 5, 7, 9, 10],
                minor: [0, 2, 3, 5, 7, 8, 10],
                harmonic_minor: [0, 2, 3, 5, 7, 8, 11],
                locrian: [0, 1, 3, 5, 6, 8, 10],
                octatonic: [0, 2, 3, 5, 6, 8, 9, 11],
                hexatonic: [0, 2, 4, 6, 8, 10],
                pentatonic: [0, 2, 4, 7, 9],
                enigma: [0, 1, 4, 6, 8, 10, 11]
               }

  def initialize(key, mode)
    @key = key
    @mode = MajorMode.new

  end

  def name
    display_key = (mode == :major ? key.upcase : key.downcase)
    "#{display_key} #{mode.to_s}"
  end

  def pitches
    return chromatic_scale if mode == :chromatic

    result = chromatic_scale.select do |note|
      INTERVALS[mode].include?(chromatic_scale.index(note))
    end

    mode.correct_too_few_accidentals(result)
  end

  private

  def chromatic_scale
    @chromatic_scale ||= begin
      if FLAT_KEYS.include?(titelized_key) || mode == :locrian || mode == :harmonic_minor
        chrom_scale = FLAT_CHROMATIC_SCALE.dup
      else
        chrom_scale = SHARP_CHROMATIC_SCALE.dup
      end

      chrom_scale[11] = "Cb" if key == "Cb"
      chrom_scale.rotate(chrom_scale.index(titelized_key))
    end
  end

  def titelized_key
    @titelized_key ||= "#{key[0].upcase}#{key[1]}"
  end

  def correct_too_few_accidentals(result)
    if mode == :major
      add_accidentals_to_major_keys(result)
    elsif mode == :minor
      add_accidentals_to_minor_keys(result)
    else
      result
    end
  end

  def add_accidentals_to_major_keys(result)
    if key == "F#"
      result[6] = "E#"
    elsif key == "C#"
      result[2] = "E#"
      result[6] = "B#"
    elsif key == 'Gb'
      result[3] = "Cb"
    elsif key == 'Cb'
      result[3] = "Fb"
      result[6] = "Bb"
    end
    result
  end

  def add_accidentals_to_minor_keys(result)
    if key == "Eb"
      result[5] = "Cb"
    elsif key == "Ab"
      result[5] = "Fb"
      result[2] = "Cb"
    elsif key == "D#"
      result[1] = "E#"
    elsif key == "A#"
      result[1] = "B#"
      result[4] = "E#"
    end
    result
  end
end


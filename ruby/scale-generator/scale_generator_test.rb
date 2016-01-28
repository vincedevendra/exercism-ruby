#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'scale_generator'

class ScaleGeneratorTest < Minitest::Test
   def test_naming_major_scale
    major = Scale.new('G', :major)
    expected = 'G major'
    actual = major.name
    assert_equal expected, actual
  end

  def test_major_scale
    major = Scale.new('C', :major)
    expected = %w(C D E F G A B)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_another_major_scale
    major = Scale.new('G', :major)
    expected = %w(G A B C D E F#)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_minor_scale_name
    minor = Scale.new('A', :minor)
    expected = "a minor"
    actual = minor.name
    assert_equal expected, actual
  end

  def test_minor_scale
    minor = Scale.new('f#', :minor)
    expected = %w(F# G# A B C# D E)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_another_minor_scale
    minor = Scale.new('bb', :minor)
    expected = %w(Bb C Db Eb F Gb Ab)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_naming_scale
    chromatic = Scale.new('c', :chromatic)
    expected = 'c chromatic'
    actual = chromatic.name
    assert_equal expected, actual
  end

  def test_chromatic_scale
    chromatic = Scale.new('C', :chromatic)
    expected = %w(C C# D D# E F F# G G# A A# B)
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_another_chromatic_scale
    chromatic = Scale.new('F', :chromatic)
    expected = %w(F Gb G Ab A Bb B C Db D Eb E)
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_dorian_mode
    dorian = Scale.new('d', :dorian)
    expected = %w(D E F G A B C)
    actual = dorian.pitches
    assert_equal expected, actual
  end

  def test_phrygian_mode
    phrygian = Scale.new('e', :phrygian)
    expected = %w(E F G A B C D)
    actual = phrygian.pitches
    assert_equal expected, actual
  end

  def test_lydian_mode
    lydian = Scale.new('a', :lydian)
    expected = %w(A B C# D# E F# G#)
    actual = lydian.pitches
    assert_equal expected, actual
  end

  def test_mixolydian_mode
    mixolydian = Scale.new('Eb', :mixolydian)
    expected = %w(Eb F G Ab Bb C Db)
    actual = mixolydian.pitches
    assert_equal expected, actual
  end

  def test_locrian_mode
    locrian = Scale.new('g', :locrian)
    expected = %w(G Ab Bb C Db Eb F)
    actual = locrian.pitches
    assert_equal expected, actual
  end

  def test_harmonic_minor
    harmonic_minor = Scale.new('d', :harmonic_minor)
    expected = %w(D E F G A Bb Db)
    actual = harmonic_minor.pitches
    assert_equal expected, actual
  end

  def test_octatonic
    octatonic = Scale.new('C', :octatonic)
    expected = %w(C D D# F F# G# A B)
    actual = octatonic.pitches
    assert_equal expected, actual
  end

  def test_hexatonic
    hexatonic = Scale.new('Db', :hexatonic)
    expected = %w(Db Eb F G A B)
    actual = hexatonic.pitches
    assert_equal expected, actual
  end

  def test_pentatonic
    pentatonic = Scale.new('A', :pentatonic)
    expected = %w(A B C# E F#)
    actual = pentatonic.pitches
    assert_equal expected, actual
  end

  def test_enigmatic
    enigmatic = Scale.new('G', :enigma)
    expected = %w(G G# B C# D# F F#)
    actual = enigmatic.pitches
    assert_equal expected, actual
  end

  def test_F_sharp_major
    major = Scale.new('F#', :major)
    expected = %w(F# G# A# B C# D# E# )
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_C_sharp_major
    major = Scale.new('C#', :major)
    expected = %w(C# D# E# F# G# A# B# )
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_G_flat_major
    major = Scale.new('Gb', :major)
    expected = %w(Gb Ab Bb Cb Db Eb F)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_C_flat_major
    major = Scale.new('Cb', :major)
    expected = %w(Cb Db Eb Fb Gb Ab Bb)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_D_sharp_minor
    minor = Scale.new('D#', :minor)
    expected = %w(D# E# F# G# A# B C#)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_A_sharp_minor
    minor = Scale.new('A#', :minor)
    expected = %w(A# B# C# D# E# F# G#)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_E_flat_minor
    minor = Scale.new('Eb', :minor)
    expected = %w(Eb F Gb Ab Bb Cb Db)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_Ab_minor
    minor = Scale.new('Ab', :minor)
    expected = %w(Ab Bb Cb Db Eb Fb Gb)
    actual = minor.pitches
    assert_equal expected, actual
  end
end

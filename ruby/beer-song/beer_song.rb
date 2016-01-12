class BeerSong
  def verse(i)
    @i = i 
    if @i >= 1
      set_verse_variables
      "#{@i} #{@first_bottle} of beer on the wall, #{@i} "\
      "#{@first_bottle} of beer.\nTake #{@one} down and pass it around, "\
      "#{@minus_1} #{@second_bottle} of beer on the wall.\n"
    else
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def verses(first, last)
    first.downto(last).each_with_object("") { |e, a| a << verse(e) << "\n" }
  end

  def sing
    verses(99, 0)
  end

  def set_verse_variables
    @first_bottle, @one = @i == 1 ? ["bottle", "it"] : ["bottles", "one"]

    if @i == 2
      @minus_1 = 1
      @second_bottle = "bottle"
    elsif @i == 1
      @minus_1 = "no"
      @second_bottle = "more bottles"
    else
      @minus_1 = @i - 1
      @second_bottle = "bottles"
    end
  end
end

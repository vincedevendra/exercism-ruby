class Bob
  def hey(remark)
    if remark.strip.empty?
      'Fine. Be that way!'
    elsif remark.upcase == remark && remark =~ /[a-zA-Z]+/
      'Whoa, chill out!'
    elsif remark =~ /\?\z/
      'Sure.'
    else
      'Whatever.'
    end
  end
end

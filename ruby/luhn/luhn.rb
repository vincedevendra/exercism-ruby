class Luhn
  attr_accessor :number
   
  def initialize(number)
    @number = number
  end

  def addends
    @addends ||= digits.reverse.map.with_index do |digit, i|
      next digit if i.even?
      (digit *= 2) >= 10 ? (digit - 9) : digit
    end.reverse
  end

  def checksum
    @checksum = addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0 
  end

  def self.create(num)
    new_num = new(num * 10)
    mod = new_num.checksum % 10
    mod == 0 ? new_num.number : new_num.number += (10 - mod)
  end

  private

  def digits
    number.to_s.chars.map(&:to_i)
  end
end

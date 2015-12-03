class Prime
  def self.nth(num)
    raise ArgumentError if num <= 0

    result_array = []
    i = 2
    while result_array.length < num
      result_array << i if prime?(i)
      i += 1
    end

    result_array.last
  end

  private

  def self.prime?(num)
    2.upto(Math.sqrt(num)).each { |i| return false if num % i == 0 }
    true
  end
end

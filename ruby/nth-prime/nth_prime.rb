class Prime
  def self.nth(num)
    raise ArgumentError if num <= 0

    n = 2
    primes = []

    begin
      primes << n if self.is_prime?(n)
      n += 1
    end until primes.size >= n

    primes.last
  end

  def self.is_prime?(num1)
    return true if num1 == 2
    num_sum = num1.to_s.chars.map(&:to_i).inject(:+) % 3
    return false if num1.even? || num_sum % 3 == 0 || num_sum % 9 == 0

    (3..num1-1).step(2) do |num2|
      return false if num1 % num2 == 0
    end

    return true
  end
end

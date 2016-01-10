class PhoneNumber
  INVALID_NUMBER = '0000000000'

  def initialize(number)
    @number = number
  end

  def number
    @clean_num || begin
      clean_non_word_chars_if_any
      clean_extra_leading_1 if starts_with_extra_1?
      valid? ? @clean_num : INVALID_NUMBER
    end
  end

  def area_code
    number[0, 3]
  end

  def to_s
    format("(%s) %s-%s", number[0..2], number[3..5], number[6..9])
  end

  private

  def clean_non_word_chars_if_any
    @clean_num = @number.gsub(/\W/, '')
  end

  def clean_extra_leading_1
    @clean_num.slice!(@clean_num[0])
  end

  def starts_with_extra_1?
    @clean_num.length == 11 && @clean_num.start_with?('1')
  end

  def contains_letter?
    @clean_num =~ /[A-Za-z]/ 
  end

  def correct_length?
    @clean_num.length == 10
  end

  def valid?
    !contains_letter? && correct_length?
  end
end

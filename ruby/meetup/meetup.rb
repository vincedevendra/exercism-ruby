class Meetup
  START_DATE_NUMS = { last: -1, teenth: 13 }
  NTH_DATE_TYPES = [:first, :second, :third, :fourth]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_name, date_type)
    @day ||= day_to_start_checking(date_type)
    increment_day_until_correct_day_name(day_name, date_type)
  end

  private

  def increment_day_until_correct_day_name(day_name, date_type)
    @day = prev_or_next_day(@day, date_type) until correct_day?(day_name, @day)
    @day
  end

  def day_to_start_checking(date_type)
    Date.new(@year, @month, start_date_num(date_type))
  end

  def correct_day?(day_name, date)
    date.send((day_name.to_s + "?").to_sym)
  end

  def prev_or_next_day(date, date_type)
    date_type == :last ? date.prev_day : date.next_day
  end

  def start_date_num(date_type)
    START_DATE_NUMS.fetch(date_type) { NTH_DATE_TYPES.index(date_type) * 7 + 1 }
  end
end

require_relative 'Zellers'
require_relative 'year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  DAY_WIDTH = 3
  MONTH_WIDTH = 20
  WEEK_LENGTH = 7

  def initialize(month, year)
    @month = month
    @year = year.to_i
  end

  def first_weekday_position
    first_weekday = Zellers.calculate(@month, 1, @year)
    if first_weekday == 0
      first_weekday = 7
    end
    first_weekday
  end

  def first_week
    first_weekday = self.first_weekday_position
    first_week = ""
    1.upto(WEEK_LENGTH) do |i|
      if i == first_weekday
        first_week << "1".rjust((DAY_WIDTH * (i)) -1)
      end
    end

    2.upto(WEEK_LENGTH) do |j|
      first_weekday += 1
      break if first_weekday > WEEK_LENGTH
      first_week << "#{j}".rjust(DAY_WIDTH)
    end
    first_week
  end

  def sunday(x)
    first_weekday = self.first_weekday_position
    sunday = (2 + (WEEK_LENGTH*(x-1))) - first_weekday
  end

  def week(x)
    sunday = self.sunday(x)
    return "".ljust(MONTH_WIDTH) if sunday > self.length
    week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(sunday + 5) do |j|
      break if j > self.length
      week << "#{j}".rjust(DAY_WIDTH)
    end
    week.ljust(MONTH_WIDTH)
  end

  def name
    MONTHS[@month]
  end

  def header
    "#{name} #{@year}".center(20)
  end

  def length
    length = 30 + ((@month + (@month/8).floor) % 2)
    if @month == 2
      Year.leap?(@year) ? length -= 1 : length -= 2
    end
    length
  end

  def to_s
    output = header.rstrip
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << first_week
    output << "\n"
    2.upto(6) do |i|
      output << week(i)
      output << "\n"
    end

    output
  end

end

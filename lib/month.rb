require_relative 'Zellers'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def first_day_position
    first_day = Zellers.calculate(@month, 1, @year)
    if first_day == 0
      first_day = 7
    end
    first_day
  end

  def first_week
    first_day = self.first_day_position
    spaces = 3
    first_week = ""
    1.upto(7) do |i|
      if i == first_day
        first_week << "1".rjust((spaces * (i)) -1)
      end
    end

    2.upto(7) do |j|
      first_day += 1
      break if first_day > 7
      first_week << "#{j}".rjust(3)
    end
    first_week
  end

  def second_week
    first_day = self.first_day_position
    sunday = 9 - first_day
    second_week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(sunday + 5) do |j|
      second_week << "#{j}".rjust(3)
    end
    second_week
  end

  def third_week
    first_day = self.first_day_position
    sunday = 16 - first_day
    third_week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(sunday + 5) do |j|
      third_week << "#{j}".rjust(3)
    end
    third_week
  end

  def fourth_week
    first_day = self.first_day_position
    sunday = 23 - first_day
    fourth_week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(sunday + 5) do |j|
      fourth_week << "#{j}".rjust(3)
    end
    fourth_week
  end

  def fifth_week
    first_day = self.first_day_position
    sunday = 30 - first_day
    return "" if sunday > self.length
    fourth_week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(self.length) do |j|
      break if j > sunday + 5
      fourth_week << "#{j}".rjust(3)
    end
    fourth_week
  end

  def sixth_week
    first_day = self.first_day_position
    sunday = 37 - first_day
    return "" if sunday > self.length
    sixth_week = "#{sunday}".rjust(2)
    sunday += 1
    sunday.upto(self.length) do |j|
      break if j > sunday + 5
      sixth_week << "#{j}".rjust(3)
    end
    sixth_week
  end

  def name
    MONTHS[@month]
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def length
    length = 30 + ((@month + (@month/8).floor) % 2)
    if @month == 2
      Year.leap?(@year) ? length -= 1 : length -= 2
    end
    length
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << first_week
    output << "\n"
    output << second_week
    output << "\n"
    output << third_week
    output << "\n"
    output << fourth_week
    output << "\n"
    output << fifth_week
    output << "\n"
    output << sixth_week
    output << "\n"

    output

  end

end

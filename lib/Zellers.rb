class Zellers
  def self.calculate(month, day, year)
    if month < 3
      year -= 1
      month += 12
    end
    weekday = day + (((month+1)*26)/10).floor + year + (year/4).floor + 6 * ((year/100).floor) + (year/400).floor

    weekday = weekday % 7

    weekday
  end


end

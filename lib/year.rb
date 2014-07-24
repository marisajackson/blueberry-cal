class Year
  attr_accessor :year
  attr_accessor :months

  def initialize(year)
    @year = year
    @months = self.get_months
  end

  def get_months
    months = []
    1.upto(12) do |i|
      months << Month.new(i, @year)
    end
    months
  end

  def self.leap?(year)
    return true if year % 4 == 0 && year % 100 == 0 && year % 400 == 0
    return true if year % 4 == 0 && year % 100 != 0
    false
  end

  def header
    string = "#{@year}".center(63).rstrip
    string << "\n\n"
  end

  def month_headers
    headers = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        headers << group
        group = ""
      end
      group << @months[i].name.center(20)
      group << "\s\s"
      if i == 11
        headers << group
      end
    end
    headers
  end

  def week_ones
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].first_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def weeks(x)
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].week(x)
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def to_s
    string = self.header

    0.upto(3) do |i|
      string << self.month_headers[i].rstrip
      string << "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
      string << self.week_ones[i].rstrip
      string << "\n"
      2.upto(6) do |j|
        string << self.weeks(j)[i].rstrip
        string << "\n"
      end
    end

    string
  end
end

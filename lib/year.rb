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

  def week_twos
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].second_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def week_threes
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].third_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def week_fours
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].fourth_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def week_fives
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].fifth_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def week_sixes
    weeks = []
    group = ""
    0.upto(11) do |i|
      if i == 3 || i == 6 || i == 9
        weeks << group
        group = ""
      end
      group << @months[i].sixth_week
      group << "\s\s"
      if i == 11
        weeks << group
      end
    end
    weeks
  end

  def to_s
    string = self.header
    string << self.month_headers[0].rstrip
    string << "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    string << self.week_ones[0].rstrip
    string << "\n"
    string << self.week_twos[0].rstrip
    string << "\n"
    string << self.week_threes[0].rstrip
    string << "\n"
    string << self.week_fours[0].rstrip
    string << "\n"
    string << self.week_fives[0].rstrip
    string << "\n"
    string << self.week_sixes[0].rstrip
    string << "\n"

    string << self.month_headers[1].rstrip
    string << "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    string << self.week_ones[1].rstrip
    string << "\n"
    string << self.week_twos[1].rstrip
    string << "\n"
    string << self.week_threes[1].rstrip
    string << "\n"
    string << self.week_fours[1].rstrip
    string << "\n"
    string << self.week_fives[1].rstrip
    string << "\n"
    string << self.week_sixes[1].rstrip
    string << "\n"

    string << self.month_headers[2].rstrip
    string << "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    string << self.week_ones[2].rstrip
    string << "\n"
    string << self.week_twos[2].rstrip
    string << "\n"
    string << self.week_threes[2].rstrip
    string << "\n"
    string << self.week_fours[2].rstrip
    string << "\n"
    string << self.week_fives[2].rstrip
    string << "\n"
    string << self.week_sixes[2].rstrip
    string << "\n"

    string << self.month_headers[3].rstrip
    string << "\nSu Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
    string << self.week_ones[3].rstrip
    string << "\n"
    string << self.week_twos[3].rstrip
    string << "\n"
    string << self.week_threes[3].rstrip
    string << "\n"
    string << self.week_fours[3].rstrip
    string << "\n"
    string << self.week_fives[3].rstrip
    string << "\n"
    string << self.week_sixes[3].rstrip
    string << "\n"

    string
  end


end

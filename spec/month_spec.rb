require_relative '../lib/month'

RSpec.describe Month do
  context "header" do

    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012    "
    end

    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901      "
    end

  end

  context ".name" do
    it "translates January" do
      Month.new(1,2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2,2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3,2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4,2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5,2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6,2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7,2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8,2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9,2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10,2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11,2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12,2012).name.should == "December"
    end
  end

  context ".first_week" do
    it "should return under Sunday for Feb 2015" do
      Month.new(2, 2015).first_week.should == " 1  2  3  4  5  6  7"
    end
    it "should return under Saturday for July 2017" do
      Month.new(7, 2017).first_week.should == "                   1"
    end
    it "should return under Thursday for February 1900" do
      Month.new(2, 1900).first_week.should == "             1  2  3"
    end
  end

  context ".second_week" do
    it "should return second week for Feb 2015" do
      Month.new(2, 2015).week(2).should == " 8  9 10 11 12 13 14"
    end
    it "should return second week for July 2017" do
      Month.new(7, 2017).week(2).should == " 2  3  4  5  6  7  8"
    end
    it "should return second week for February 1900" do
      Month.new(2, 1900).week(2).should == " 4  5  6  7  8  9 10"
    end
  end

  context ".third_week" do
    it "should return third week for Feb 2015" do
      Month.new(2, 2015).week(3).should == "15 16 17 18 19 20 21"
    end
    it "should return third week for July 2017" do
      Month.new(7, 2017).week(3).should == " 9 10 11 12 13 14 15"
    end
    it "should return third week for February 1900" do
      Month.new(2, 1900).week(3).should == "11 12 13 14 15 16 17"
    end
  end

  context ".fourth_week" do
    it "should return fourth week for Feb 2015" do
      Month.new(2, 2015).week(4).should == "22 23 24 25 26 27 28"
    end
    it "should return fourth week for July 2017" do
      Month.new(7, 2017).week(4).should == "16 17 18 19 20 21 22"
    end
    it "should return fourth week for February 1900" do
      Month.new(2, 1900).week(4).should == "18 19 20 21 22 23 24"
    end
  end

  context ".fifth_week" do
    it "should return fifth week for Feb 2015" do
      Month.new(2, 2015).week(5).should == "                    "
    end
    it "should return fifth week for July 2017" do
      Month.new(7, 2017).week(5).should == "23 24 25 26 27 28 29"
    end
    it "should return fifth week for February 1900" do
      Month.new(2, 1900).week(5).should == "25 26 27 28         "
    end
  end

  context ".sixth_week" do
    it "should return sixth week for Feb 2015" do
      Month.new(2, 2015).week(6).should == "                    "
    end
    it "should return sixth week for July 2017" do
      Month.new(7, 2017).week(6).should == "30 31               "
    end
    it "should return sixth week for February 1900" do
      Month.new(2, 1900).week(6).should == "                    "
    end
  end

  context ".length" do
    it "should return 31 for december 2011" do
      Month.new(12, 2011).length.should == 31
    end
    it "should return 30 for november 2011" do
      Month.new(11, 2011).length.should == 30
    end
    it "should return 29 for february 2012" do
      Month.new(2, 2012).length.should == 29
    end
    it "should return 28 for february 2011" do
      Month.new(2, 2011).length.should == 28
    end
  end

end

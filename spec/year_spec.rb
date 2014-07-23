require_relative '../lib/year'

RSpec.describe Year do
  context "leap?" do
    it "should return true for 2012" do
      Year.leap?(2012).should == true
    end
    it "should return false for 2011" do
      Year.leap?(2011).should == false
    end
    it "should return true for 2000" do
      Year.leap?(2000).should == true
    end
    it "should return false for 1900" do
      Year.leap?(1900).should == false
    end
    it "should return false for 2100" do
      Year.leap?(2100).should == false
    end
  end

  context "header" do
    it "matches cal for 2012" do
      year = Year.new(2012)
      year.header.should == "                             2012\n\n"
    end
    it "matches cal for 1999" do
      year = Year.new(1999)
      year.header.should == "                             1999\n\n"
    end
  end

end

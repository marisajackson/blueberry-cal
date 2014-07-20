require_relative '../lib/Zellers'

RSpec.describe Zellers do
  context ".calculate" do
    it "returns 1 for December 2013" do
      Zellers.calculate(12, 1, 2013).should == 1
    end
    it "returns 0 for July 2017" do
      Zellers.calculate(7, 1, 2017).should == 0
    end
    it "returns 6 for January 2016" do
      Zellers.calculate(1, 1, 2016).should == 6
    end
    it "returns 3 for February 2000" do
      Zellers.calculate(2, 1, 2000).should == 3
    end
  end
end

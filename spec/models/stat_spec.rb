require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Stat do
  before(:each) do
    @stat = Stat.new
  end

  it "should be valid" do
    @stat.should be_valid
  end
end

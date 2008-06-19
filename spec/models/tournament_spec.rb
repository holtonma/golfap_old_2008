require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tournament do
  before(:each) do
    @tournament = Tournament.new
  end

  it "should be valid" do
    @tournament.should be_valid
  end
end

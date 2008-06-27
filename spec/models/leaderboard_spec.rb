require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Leaderboard do
  before(:each) do
    @leaderboard = Leaderboard.new
  end

  it "should be valid" do
    @leaderboard.should be_valid
  end
end

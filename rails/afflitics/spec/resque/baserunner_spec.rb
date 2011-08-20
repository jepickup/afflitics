require 'spec_helper'

describe "Requesting getbasestats" do

  before do
    ResqueSpec.reset!
    @tester = RunnerTest.new
  end

  it "should add BaseRunner to the queue" do
    @tester.getbasestats
    RunnerTest.should have_queue_size_of(1)
  end

end


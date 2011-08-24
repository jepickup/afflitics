require 'spec_helper'
require 'resque_spec/scheduler'

describe RunnerTest do

  before do
    ResqueSpec.reset!
    @tester = RunnerTest.new
  end

  it "should add BaseRunner to the queue" do
    @tester.getbasestats
    RunnerTest.should have_queue_size_of(1)
    #RunnerTest.should have_queued("var").in(:base)
  end

=begin

  Cannot test scheduled jobs

  it "should" do
    @tester.schedule_getbasestats
    RunnerTest.should have_scheduled("var")
  end

=end

end

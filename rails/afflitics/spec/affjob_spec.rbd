require 'affjob'
require 'spec_helper'

module AffJobSpecHelper

  def valid_job_attributes
  end

end

describe AffJob do

  context "when arguments are empty" do

    it do
      expect { AffJob.new }.to raise_error(ArgumentError)
    end

    before { @affjob = AffJob.new }
    
    
    specify { @affjob.network.should be_nil }
    specify { @affjob.service.should be_nil }
    specify { @affjob.configuration.should be_empty }

    #fail request
    #fail response
  end

  context "when network not empty" do

    before { @affjob = AffJob.new :fakenet, :svc_12345, { :c => "a" } }
    
    specify { @affjob.network.should_not be_empty }
    specify { @affjob.network.should eq(:fakenet) }
    specify { @affjob.network.object_id.should eq(:fakenet.object_id) }

  end

=begin
    it "should have a request" do
      @affjob.request.should be_an_instance_of(String)
    end
=end

end

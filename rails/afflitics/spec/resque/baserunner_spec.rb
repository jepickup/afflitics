require 'spec_helper'

describe BaseRunner do

  before(:each) { @BR = BaseRunner.new }

  subject { @BR }

  describe "Setting up BaseRunner" do

    specify { should respond_to(:perform).with(3).arguments }
    specify { should_not respond_to(:perform).with(0).arguments }

    context "With a network argument" do

      it "should raise an InvalidNetworkError if network is invalid" do
        lambda { @BR.perform(:invalid_network, @valid_function, @valid_user_config)}.should raise_error(RuntimeError, "InvalidNetworkError")
      end

      it "should not raise an error if network is valid" do
        lambda { @BR.perform(@valid_network, @valid_function, @valid_user_config)}.should_not raise_error
      end

      it "should not raise an error when finding a service" do
        lambda { @BR.perform(@valid_network, @valid_function, @valid_user_config)}.should_not raise_error
      end

    end

    context "Request Argument" do

      it "should raise an InvalidRequestError if the request cannot be mapped to a function" do
        lambda { @BR.perform(@valid_network, :invalid_request, @valid_user_config)}.should raise_error(RuntimeError, "InvalidRequestError")
      end

      it "should not raise an error if the request can be mapped to a function" do
        lambda { @BR.perform(@valid_network, @valid_function, @valid_user_config)}.should_not raise_error
      end

    end

    context "User Config" do

      it "should raise a UserConfigEmptyError if the config hash is empty" do
        lambda { @BR.perform(@valid_network, @valid_function, { })}.should raise_error(RuntimeError, "UserConfigEmptyError")
      end

      it "should not raise an error if the config hash is not empty" do
        lambda { @BR.perform(@valid_network, @valid_function, @valid_user_config )}.should_not raise_error
      end

    end

  end

  describe "Calling the fetcher" do

    before(:each) { @BR.perform(@valid_network, @valid_function, {:username => 'afftest' }) }

=begin
  Call the fetcher with x arguments
  Return true
=end

  end

end

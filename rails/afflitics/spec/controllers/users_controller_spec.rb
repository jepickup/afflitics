require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = Factory(:user)
    sign_in @user
  end


end

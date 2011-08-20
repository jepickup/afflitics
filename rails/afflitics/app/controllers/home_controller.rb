class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def queue
    Resque.enqueue(BaseRunner)
    render :text => "Running stats.." 
  end

end

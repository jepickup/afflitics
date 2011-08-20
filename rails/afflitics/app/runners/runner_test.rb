class RunnerTest

  @queue = :base

  def getbasestats
    Resque.enqueue(BaseRunner)
  end

end

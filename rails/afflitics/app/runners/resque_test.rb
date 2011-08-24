class RunnerTest

  @queue = :base

  def getbasestats
    Resque.enqueue(BaseRunner, "var")
  end

  def schedule_getbasestats
    Resque.enqueue_at(Time.now, BaseRunner, "var")
  end

end

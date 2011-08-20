module BaseRunner
  @queue = :base

  def self.perform
    puts "Running stats.."
  end
end

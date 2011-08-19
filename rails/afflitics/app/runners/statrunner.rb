module Eat
  @queue = :food

  def perform(food)
    puts "Ate #{food}!"
  end
end

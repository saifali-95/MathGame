#Class Player will store Player 1 and Player 2 names, lifeline and scores

class Player
  attr_accessor :name, :lifeline, :scores
 
  def initialize(name)
    @name = name
    @lifeline = 3
    @scores = 0
  end
end


#Class Question will generate maths addition question by picking 1 to 20 random numbers.

class Question
  attr_reader :current_question, :answer

  def initialize
    @current_question = nil
    @answer = nil
  end

  def create_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    sum(num1, num2)
    @current_question = "What does #{num1} plus #{num2} equals to?"
  end

  private

  def sum(num1, num2)
    @answer = num1 + num2
  end
end
#Import relevant classes

require_relative 'question'
require_relative 'gameReferee'
require_relative 'player'

#Class MathGame will Start the game with a introductory text MATH GAME and Instantiating classes
class MathGame
  WELCOME = "M-A-T-H G-A-M-E. Game is About to Begin\n"
  GAME_REFEREE = GameReferee.new
  PLAYER = Player 
  QUESTION = Question.new
end

#main Game class that will call different methods and classes

class Game
  def initialize
    @referee = MathGame::GAME_REFEREE
    @player1 = nil
    @player2 = nil
    @current_player = nil
    @continue_game = true
    @turn = 0
  end

  def start_game
    @referee.cli_text(MathGame::WELCOME)
    create_players
    @current_player = @player1

    while @continue_game
      @referee.cli_text("\n----- NEW TURN -----")
      get_question
      switch_players
    end
  end

  private

  def create_players
    create =  MathGame::PLAYER
    @referee.cli_text("Player # 1, PLEASE ENTER YOUR NAME: ")
    player_name1 = @referee.player_input
    @player1 = create.new(player_name1)

    @referee.cli_text("Player # 2, PLEASE ENTER YOUR NAME: ")
    player_name2 = @referee.player_input
    @player2 = create.new(player_name2)

    @referee.cli_text("Let's Start the Game Between #{@player1.name} and #{@player2.name}")
  end

  def get_question
    question = MathGame::QUESTION.create_question
    @referee.cli_text("#{@current_player.name}: #{question}")
    get_answer
  end

  def get_answer
    answer = @referee.player_input
    score_decider(answer)
  end

  def score_decider(answer)
    if (answer.to_i == MathGame::QUESTION.answer)
      increase_scores(@current_player)
    else
      decrease_lifeline(@current_player)
    end
    show_score
    player_dead?(@current_player)
  end

  def increase_scores(player)
    @referee.cli_text("Yes! You are correct!")
    player.scores += 1
  end

  def decrease_lifeline(player)
    @referee.cli_text("Seriously? No!")
    player.lifeline -= 1
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def player_dead?(player)
    (player.lifeline == 0) ? game_end : false
  end

  def get_winner
    @player1.lifeline > @player2.lifeline ? @player1 : @player2
  end

  def show_score
    @referee.cli_text("#{@player1.name}: #{@player1.lifeline}/3 ---- vs ---- #{@player2.name}: #{@player2.lifeline}/3")
  end

  def game_end
    winner = get_winner
    @referee.cli_text("The Winner is #{winner.name} with #{winner.scores} score !!!!")
    @continue_game = false
    @referee.cli_text("\n----- GAME OVER -----")
    @referee.cli_text("\n Good Bye! ")
  end

end

game = Game.new
game.start_game
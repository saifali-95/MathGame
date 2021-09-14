#Class GameReferee will throw questions on the CLI and will be responsible in get player's answer via CLI

class GameReferee

  def cli_text (text)
    puts "#{text}"
  end 

  def player_input
    @input = gets.chomp 
  end

end


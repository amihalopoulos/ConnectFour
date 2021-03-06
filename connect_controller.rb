require_relative 'connect_four'

player = ["X", "O"].shuffle

board = Board.new(player)

def get_position(player)
  puts "Player #{player}: What's Your Move?"
  position = gets.chomp.to_i
  if position > 6 || position < 0
    puts "Please enter a valid column"
    get_position(player)
  else
    position
  end
end

loop do
  player.each do |player|
    puts board
    begin
      position = get_position(player)
    end until placement = board.place(player, position) #unless it returns "Column Filled!"
    board.check_connect_four(player, placement[0], placement[1])
    if board.winner
      p board.to_s
      puts "Player #{player} WINS!"
      break
    elsif board.tie
      puts board
      puts "Tie game! Nobody Wins! All Losers!"
      break
    end
    board.clear_screen
  end
  break if board.winner
end







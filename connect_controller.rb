require_relative 'connect_four'

player = ["X", "O"].shuffle

board = Board.new(player)

def get_position(player)
  puts "Player #{player}: What's Your Move?"
  position = gets.chomp.to_i
  if position > 6 || position < 0
    puts "Please enter a valid column"
    get_position
  end
  position
end

loop do
  player.each do |player|
    puts board
    position = get_position(player)
    board.place(player, position)
    if board.winner
      puts board
      puts "Player #{player} WINS!"
      break
    end
    # abort(if board.winner
    board.clear_screen
  end
  break if board.winner
end







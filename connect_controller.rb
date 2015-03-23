require_relative 'connect_four'

player = ["X", "O"]

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

until false #board.winner
  player.each do |player|
    puts board
    # puts "Player #{player}: What's Your Move?"
    # position = gets.chomp.to_i
    position = get_position(player)
    board.place(player, position)
    board.clear_screen
  end
end





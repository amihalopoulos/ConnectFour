require_relative 'connect_four'

player = ["X", "O"]

board = Board.new(player)


until false #board.winner
  player.each do |player|
    puts board
    # puts "Player #{player}: What's Your Move?"
    # position = gets.chomp.to_i
    get_position
    board.place(player, position)
    board.clear_screen
  end
end

def get_position
  puts "Player #{player}: What's Your Move?"
  position = gets.chomp.to_i
  if position > 6 || position < 0
    puts "Please enter a valid column"
    get_position
  end
  position
end



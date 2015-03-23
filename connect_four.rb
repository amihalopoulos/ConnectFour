#pseudocode
#
# Initialize
#  -create 2D array - 6 arrays each containing 7 elements and transpose them so they act as columns
#  -take arguments of player, column (X, 3)

class Board

  def initialize(player)
    @board = Array.new(7) {[" ", " ", " ", " ", " ", " ", " "]}
    @col_board = @board.transpose
    @player = player
  end

  def place(player, position, x = -1)
    return "Column Filled!" if x == -8
    if @board[position][x] == ' '
      @board[position][x].replace(player)
    else
      place(player, position, x -= 1)
    end
  end

  def to_s
    @board.transpose.each do |column|
      puts "| " + column.join(' ') + " |"
    end
      puts "-----------------"
      puts "- 0 1 2 3 4 5 6 -"
  end

  def clear_screen
    print "\e[H\e[2J"
  end

  def winner

  end

end

  game1 = Board.new(players = ["x", "y"])
  # game1.place("x", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("X", 3)
 #game1.to_s


#>player 1 whats yuour move? input =gets.chomp

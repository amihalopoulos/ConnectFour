#pseudocode
#
# Initialize
#  -create 2D array - 6 arrays each containing 7 elements and transpose them so they act as columns
#  -take arguments of player, column (X, 3)

class Board

  def initialize
    @board = Array.new(7) {[1,2,3,4,5,6]}
  end

  def place
  end

  def to_s
    @board.transpose.each do |column|
      puts "| " + column.join(' ') + " |"
    end
      puts "-----------------"
      puts "- 0 1 2 3 4 5 6 -"
  end

end

game1 = Board.new
game1.to_s
#>player 1 whats yuour move? input =gets.chomp

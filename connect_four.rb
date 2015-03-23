#pseudocode
#
# Initialize
#  -create 2D array - 6 arrays each containing 7 elements and transpose them so they act as columns
#  -take arguments of player, column (X, 3)

class Board
    attr_reader :board
  def initialize(player)
    @board = Array.new(7) {[" ", " ", " ", " ", " ", " ", " "]}
    @player = player
  end

  def place(player, position, x = 0)
    return "Column Filled!" if x == 7
    if @board[position][x] == ' '
      @board[position][x].replace(player)
    else
      place(player, position, x += 1)
    end
    y = @board[position].index(player)
    x = position
    #call method to check connect 4
  end

  def check_connect_four
    check_row || check_col || check_diag
  end

  def check_up_down(player, x, y, count = 0) #can we pass cell(x,y)
   return true if count == 4
   if cell(x, y) == player
    #count += 1
    check_up_down(player, x, y + 1, count +=1)
  end
  end

  def check(player, x, y)
    i = 1
    until i > 3
      cell(x + i, y) #==> 'x' or ' '
      cell(x - i, y)
      cell(x, y - i)
      cell(x, y + i)
      cell(x + i, y + i)
      cell(x - i, y + i)
      cell(x + i, y - i)
      cell(x - i, y - i)
      i += 1
    end
  end

  def cell(x, y)
    if x < 0 || x > 7 || y < 0 || y > 6
      return nil
    else
      @board[x][y]
    end
  end



  def to_s
    @board.transpose.reverse.each do |column|
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
   game1.place("x", 3)
 game1.place("O", 3)
 game1.place("O", 3)
 game1.place("O", 3)
 game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("X", 3)
 game1.to_s
 p game1.board
 p game1.check_up_down("O", 3, 1)



#>player 1 whats yuour move? input =gets.chomp

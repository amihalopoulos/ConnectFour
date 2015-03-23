#pseudocode
#
# Initialize
#  -create 2D array - 6 arrays each containing 7 elements and transpose them so they act as columns
#  -take arguments of player, column (X, 3)

class Board
    attr_reader :board, :winner
  def initialize(player)
    @board = Array.new(7) {[" ", " ", " ", " ", " ", " ", " "]}
    @player = player
    @winner = false
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

  def check_connect_four(player, x, y)
    if check_left_right(player, x, y, count = 0) == 4
      winner = true
      true
    elsif check_top_left_diag(player, x, y, count = 0) == 4
      winner = true
      true
    elsif check_top_right_diag(player, x, y, count = 0) == 4
      winner = true
      true
    elsif check_up_down(player, x, y, count = 0) == 4
      winner = true
      true
    else
      false
    end
  end

  def check_up_down(player, x, y, count = 0) #can we pass cell(x,y)
    count = 1+ check_direction(player, x, y, 0, 1) + check_direction(player, x, y, 0, -1)
  end

  def check_left_right(player, x, y, count = 0)
    count = 1+ check_direction(player, x, y, 1, 0) + check_direction(player, x, y, -1, 0)
  end

  def check_top_left_diag(player, x, y, count = 0)
    count = 1+ check_direction(player, x, y, -1, 1) + check_direction(player, x, y, 1, -1)
  end

  def check_top_right_diag(player, x, y, count = 0)
    count = 1+ check_direction(player, x, y, 1, 1) + check_direction(player, x, y, -1, -1)
  end

  def check_direction(player, x, y, add_x, add_y, count = 0)
    if cell(x + add_x, y + add_y) == player
      count +=1
      check_direction(player, x + add_x, y + add_y, add_x, add_y, count )
    else
      count
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

  # def winner
  #   check_connect_four
  # end

end

  game1 = Board.new(players = ["x", "y"])
   game1.place("x", 3)
 game1.place("O", 3)
 game1.place("O", 3)
 game1.place("O", 3)
 p game1.winner
 game1.place("O", 3)
# game1.place("O", 3)
# game1.place("O", 3)
# game1.place("X", 3)
# game1.to_s
 p game1.check_connect_four("O", 3, 0)
 p game1.winner



#>player 1 whats yuour move? input =gets.chomp


class Board
    attr_reader :board, :winner, :tie
  def initialize(player)
    @board = Array.new(7) {[" ", " ", " ", " ", " ", " ", " "]}
    @player = player
  end

  def place(player, x, y = 0)
    return nil if y == 7
    if cell(x, y) == ' '
      cell(x,y).replace(player)
      return [x,y]
    else
      place(player, x, y += 1)
    end
  end

  def check_connect_four(player, x, y)
    if check_left_right(player, x, y) == 4 || check_top_left_diag(player, x, y) == 4 || check_top_right_diag(player, x, y) == 4 || check_up_down(player, x, y) == 4
      @winner = true
    elsif !board.flatten.include?(' ')
      @tie = true
    else
      false
    end
  end

  def check_up_down(player, x, y, count = 0)
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
    x < 0 || x > 6 || y < 0 || y > 7 ? nil : board[x][y]
  end

  def to_s
    board.transpose.reverse.each do |column|
      puts "| " + column.join(' ') + " |"
    end
      puts "-----------------"
      puts "- 0 1 2 3 4 5 6 -"
      return "  Connect Four!"
  end

  def clear_screen
    print "\e[H\e[2J"
  end

end

#   game1 = Board.new(players = ["x", "y"])
#    game1.place("x", 3)
#  game1.place("O", 3)
#  game1.place("O", 3)
#  game1.place("O", 3)
#  game1.place("O", 3)
# # game1.place("O", 3)
# # game1.place("O", 3)
# # game1.place("X", 3)
#  game1.to_s
#  p game1.check_connect_four("O", 3, 1)
#  p game1.winner


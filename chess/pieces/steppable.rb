module Steppable

  HORIZONTAL_DIRS = [[0, -1], [0, 1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, 1], [-1, -1], [1, 1], [1, -1]]

  HORIZONTAL_AND_DIAGONAL_DIRS = HORIZONTAL_DIRS + DIAGONAL_DIRS
  
  def moves
    moves = []
    move_dirs.each { |dx, dy| moves + grow_unblocked_moves_in_dir(dx, dy) }
    moves
  end

  private
  def grow_unblocked_moves_in_dir(dx, dy)
    x, y = pos
    moves = []
    while
      x, y = x + dx, y + dy
      pos = [x, y]

      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != color
        break
      end
    end
    moves
  end

end

#  [1,0], [0,-1], [-1,-1], [-1,0], [-1,1], [0,1], [1,1], [1,0]
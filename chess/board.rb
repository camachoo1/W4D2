class Board
  attr_reader :rows
  def initialize(rows, null_piece)
    @rows = Array.new(8) { Array.new(8, @null_piece) }
    @null_piece = NullPiece.instance
  end

  def [](pos)
    raise "Not a valid position" unless valid_pos?(pos)
    x, y = pos
    rows[x][y] 
  end

  def []=(pos, piece)
    raise "Not a valid position" unless valid_pos?(pos)

    x, y = pos
    rows[x][y] = piece
  end

  def move_piece(color, start_pos, end_pos)
    
  end

  def valid_pos?(pos)
    x, y = pos
    if x > 7 || y > 7
        return false
    else
        return true
    end
  end





  private
  attr_reader :null_piece
end
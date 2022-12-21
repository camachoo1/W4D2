require_relative "pieces"

class Board
  attr_reader :rows
  
  def initialize
    @null_piece = NullPiece.instance
    @rows = fill_board
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

  def move_piece(start_pos, end_pos)
    raise "nothing here" if self.empty?(start_pos)
    raise "can't go there...already a piece there" unless self.valid_pos?(end_pos)

    # if piece.color != color
    #   raise "not your turn"
    # if piece.color == color
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = null_piece
    # end
    # queue = []
    # until queue.empty?
  end

  def empty?(pos)
    self[pos].empty?
  end

  def valid_pos?(pos)
    x, y = pos
    if x > 7 || y > 7
        return false
    else
        return true
    end
  end

  def add_piece(piece, pos)
    raise "already something there" unless empty?(pos)
    
    self[pos] = piece
  end

  def checkmate?(color)

  end

  def in_check?(color)
  end

  def pieces
    @rows.flatten.reject { |pos| pos.empty? }
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end


  private
  attr_reader :null_piece
  def fill_front(color)
    front_row = Array.new(8)

    if color == :black
      i = 1
    else
      i = 6
    end

    front_row.length.times { |j| self[[i, j]] = Pawn.new(color, self, [i, j]) }
  end

  def fill_back(color)
   back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

   if color == :black
    i = 0
   else
    i = 7
   end

   back_row.each_with_index { |class_piece, j| self[[i, j]] = class_piece.new(color, self, [i, j]) }
  end

  def fill_board
    @rows = Array.new(8) { Array.new(8, null_piece) }
    fill_front(:black)
    fill_back(:black)
    fill_front(:white)
    fill_back(:white)
    rows
  end
end

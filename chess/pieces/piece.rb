class Piece
  attr_reader :color, :display
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = :color
    @board = board
    @pos = pos
  end
  
end
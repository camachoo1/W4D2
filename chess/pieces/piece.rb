require "./board"

class Piece
  attr_reader :color, :display
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = :color
    @board = board
    @pos = pos
  end
  
  def to_s
    " #{symbol}"
  end

  def empty?
    false
  end

  def moves
    
  end

  def pos=(val)
  end

  def symbol
  end

  private
  def move_into_check?(end_pos)
  end
end
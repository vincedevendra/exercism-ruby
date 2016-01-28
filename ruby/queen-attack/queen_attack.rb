class Queens
  attr_reader :white, :black

  def initialize(args = {})
    @white = args.fetch(:white) { [0, 3] }
    @black = args.fetch(:black) { [7, 3] }
    @board = Board.new
    mark_board
    raise ArgumentError if white == black
  end

  def attack?
    same_column_or_row? || same_diagonal?
  end

  def to_s
    @board.to_s
  end

  private

  def mark_board
    @board.mark(white, 'W')
    @board.mark(black, 'B')
  end

  def same_column_or_row?
    white[0] == black[0] || white[1] == black[1]
  end

  def same_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

  class Board
    attr_reader :state

    def initialize
      @state = Array.new(8).map { %w(_ _ _ _ _ _ _ _) }
    end

    def to_s
      state.map { |line| line.join(' ') }.join("\n")
    end

    def mark(position, marker)
      state[position[0]][position[1]] = marker
    end
  end
end

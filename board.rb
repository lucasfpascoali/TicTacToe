class Board
  attr_reader :board

  def initialize
    @board = {
      A: Array.new(3) { ' ' },
      B: Array.new(3) { ' ' },
      C: Array.new(3) { ' ' }
    }
  end

  def add_play(row, column, player_symbol)
    return nil unless coords_valid?(row, column)

    board[row][column] = player_symbol
    true
  end

  def someone_win
    horizontally_win || vertically_win || diagonally_win
  end

  def draw
    draw = board.all? do |_, value|
      !value.include?(' ')
    end

    draw ? 'draw' : false
  end

  def show_board
    puts '  1  2  3'
    puts "A #{board[:A][0]}  #{board[:A][1]}  #{board[:A][2]}"
    puts "B #{board[:B][0]}  #{board[:B][1]}  #{board[:B][2]}"
    puts "C #{board[:C][0]}  #{board[:C][1]}  #{board[:C][2]}"
  end

  private

  attr_writer :board

  def coords_valid?(row, column)

    unless board.dig(row, column)
      puts "There isn't a place in row: #{row} and column: #{column + 1}"
      return nil
    end

    unless board.dig(row, column) == ' '
      puts 'This place already has a symbol'
      return nil
    end

    true
  end

  def horizontally_win
    board.each do |_, value|
      return 'X' if value == %w[X X X]
      return 'O' if value == %w[O O O]
    end
    nil
  end

  def vertically_win
    vertical_sequences = Array.new(3) { [] }
    board.each do |_, value|
      vertical_sequences[0].push(value[0])
      vertical_sequences[1].push(value[1])
      vertical_sequences[2].push(value[2])
    end

    return 'X' if vertical_sequences.include?(%w[X X X])
    return 'O' if vertical_sequences.include?(%w[O O O])

    nil
  end

  def diagonally_win
    diagonal_sequences = [[board[:A][0], board[:B][1], board[:C][2]], [board[:A][2], board[:B][1], board[:C][0]]]
    return 'X' if diagonal_sequences.include?(%w[X X X])
    return 'O' if diagonal_sequences.include?(%w[O O O])

    nil
  end

end

require_relative 'board'

class Game
  attr_reader :board

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @turn = 0
  end

  def play
    until (winner = board.someone_win || board.draw)
      board.show_board
      user_turn
    end
    output = winner == 'draw' ? "DRAW!!!" : "Congratulations!!! The #{winner} wins!!!"
    board.show_board
    puts output
  end

  private

  attr_reader :players
  attr_accessor :turn

  def user_turn
    player = who_play
    loop do
      user_coords = player.user_input
      break if board.add_play(user_coords[0].to_sym, user_coords[1].to_i - 1, player.symbol)
    end
  end

  def who_play
    player = turn.even? ? players[0] : players[1]
    self.turn += 1
    player
  end

end

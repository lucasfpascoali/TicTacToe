require_relative 'game'
require_relative 'player'

player1 = Player.new('Player1', 'X')
player2 = Player.new('Player2', 'O')

game1 = Game.new(player1, player2)
game1.play

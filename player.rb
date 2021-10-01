class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def user_input
    puts "Player #{name} type the coordinates"
    gets.chomp.split('')
  end
end

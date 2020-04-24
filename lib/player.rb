class Player
  attr_accessor :name, :score, :mark, :turn

  def initialize(name, number)
    @name = name
    @score = 0
    @mark = attributes_a_mark(number)
    @turn = number
  end

  def attributes_a_mark(number)
    if number == 1
      return "X"
    else
      return "O"
    end
  end

end
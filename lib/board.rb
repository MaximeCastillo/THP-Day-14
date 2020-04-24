class Board
  attr_accessor :board

  def initialize
    @board = Array.new(9)
  end

  def board_is_full?
    answer = true
    @board.each do |boardcase|
      answer = false if boardcase == nil
    end
    return answer
  end

  def is_this_boardcase_available? (boardcase)
    boardcase == nil
  end

  def convertor(input)
    case input
    when "A1"
      boardcase_index = 0
    when "A2"
      boardcase_index = 1
    when "A3"
      boardcase_index = 2
    when "B1"
      boardcase_index = 3
    when "B2"
      boardcase_index = 4
    when "B3"
      boardcase_index = 5
    when "C1"
      boardcase_index = 6
    when "C2"
      boardcase_index = 7
    when "C3"
      boardcase_index = 8
    end
  end

end
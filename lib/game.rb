class Game
  attr_accessor :players, :my_board
  
  def initialize
    puts "Pour commencer une partie, indiquez vos pseudos :"
    @players = define_players
    @my_board = Array.new(9)
  end

  def define_players
    print "Pseudo du Joueur 1 : "
    name1 = gets.chomp
    role1 = attributes_a_role
    player1 = Player.new(name1, role1)
    puts
    print "Pseudo du Joueur 2 : "
    name2 = gets.chomp
    if role1 == 1 
      role2 = 2
    else
      role2 = 1
    end
    player2 = Player.new(name2, role2)
    puts
    return [player1, player2]
  end

  def attributes_a_role
    return rand(1..2)
  end

  def is_still_ongoing?
    return !has_a_winner? && !board_is_full?(@my_board)
  end

  def has_a_winner?
    (@my_board[0] != nil && @my_board[0] == @my_board[1] && @my_board[1] == @my_board[2]) || (@my_board[3] != nil && @my_board[3] == @my_board[4] && @my_board[4] == @my_board[5]) || (@my_board[6] != nil && @my_board[6] == @my_board[7] && @my_board[7] == @my_board[8]) || (@my_board[0] != nil && @my_board[0] == @my_board[3] && @my_board[3] == @my_board[6]) || (@my_board[1] != nil && @my_board[1] == @my_board[4] && @my_board[4] == @my_board[7]) || (@my_board[2] != nil && @my_board[2] == @my_board[5] && @my_board[5] == @my_board[8]) || (@my_board[0] != nil && @my_board[0] == @my_board[4] && @my_board[4] == @my_board[8]) || (@my_board[2] != nil && @my_board[2] == @my_board[4] && @my_board[4] == @my_board[6])
  end

  def board_is_full?(board)
    answer = true
    board.each do |boardcase|
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
      return boardcase_index = 0
    when "A2"
      return boardcase_index = 1
    when "A3"
      return boardcase_index = 2
    when "B1"
      return boardcase_index = 3
    when "B2"
      return boardcase_index = 4
    when "B3"
      return boardcase_index = 5
    when "C1"
      return boardcase_index = 6
    when "C2"
      return boardcase_index = 7
    when "C3"
      return boardcase_index = 8
    end
  end

  def a_turn
    puts "C'est au tour de #{@players[whos_next].name} !"
    show
    puts "Sur quelle case veux-tu jouer ?"
    print "> "
    input = gets.chomp
    # while input != "A1" ||  input != "A2" || input != "A3" || input != "B1" || input != "B2" || input != "B3" || input != "C1" || input != "C2" || input != "C3"
    #   puts "Je n'ai pas compris ton choix..."
    #   puts "Sur quelle case veux-tu jouer ?"
    #   print "> "
    #   input = gets.chomp
    # end
    puts boardcase_index = convertor(input)
    puts boardcase = @my_board[boardcase_index]
    while !is_this_boardcase_available?(boardcase)
      puts "Ah, malheureusement cette case est déjà prise ! Essayes-en une autre :"
      print "> "
      input = gets.chomp
      puts boardcase_index = convertor(input)
      puts boardcase = @my_board[boardcase_index]
    end
    @my_board[boardcase_index] = @players[whos_next].mark
    @players[whos_next].turn += 2

  end

  def whos_next
    if @players[0].turn < @players[1].turn
      return 0
    else
      return 1
    end
  end

  def who_won
    if whos_next == 0
      return 1
    else
      return 0
    end
  end


  def end_of_game
    puts "La partie est finie !"
    if has_a_winner? == true
      puts "Bravo à toi, #{players[who_won].name} ! Tu viens de remporter la partie !"
      players[who_won].score += 1
    else
      puts "C'est un match nul !"
    end
    puts "Voulez-vous refaire une partie ? (O/N)"
    print "> "
    if gets.chomp == "O"
      my_board = Array.new(9)
      players[who_won].turn = 1
      if players[0].turn == 1
        players[1].turn = 0
      else
        players[0].turn = 0
      end
      play
    else gets.chomp == "N"
      puts "Voici vos scores :"
      puts "#{players[0].name} a gagné #{players[0].score} fois et #{players[1].name} a gagné #{players[1].score} fois."
      puts "...A bientôt ! :D"
    end
  end

  def play
    while is_still_ongoing?
      a_turn
    end
    end_of_game
  end

  def show
    puts " ------------"
    puts "| #{my_board[0]}  | #{my_board[1]}  | #{my_board[2]}  |"
    puts " ------------"
    puts "| #{my_board[3]}  | #{my_board[4]}  | #{my_board[5]}  |"
    puts " ------------"
    puts "| #{my_board[6]}  | #{my_board[7]}  | #{my_board[8]}  |"
    puts " ------------"
  end

end

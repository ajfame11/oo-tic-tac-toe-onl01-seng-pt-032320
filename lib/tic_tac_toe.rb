class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    a = input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turn += 1
      end
    end
    return turn
  end
  
  def current_player
      if turn_count.even?
        player = "X"
      else
        player = "O"
      end
    return player
  end
  
  def turn
    puts "Please choose a number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end
    end
        return false
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
require('pry')

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  # def won?
  #   winning_combination=nil
  #   winning_combination = WIN_COMBINATIONS.detect do |combination|
  #     self.cells[combination[0]] != " " && self.cells[combination[0]] == self.cells[combination[1]] && self.cells[combination[1]] == self.cells[combination[2]]
  #   end
  # end'def won?(board)


  # Define display_board that accepts a board and prints
  # out the current state.
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(index)
    self.cells[index.to_i-1]
  end

  def position_on_board?(index)
    value = index.scan(/[0-9]*/)[0]
    if value != ""
      value = value.to_i
      result = value.between?(0,8)
    else
      result = false
    end
  end

  def turn_count
    turn = 0
    self.cells.each do |item|
      turn+=1 if(item=="O" || item=="X")
    end
    turn
  end

  def full?
    !self.cells.any?{|i| i==" "}
  end

  def taken?(index)
    (position(index)=="X" || position(index)=="O")
  end

  def valid_move?(index)
    if position_on_board?(index) && !taken?(index)
      return true
    else
      return false
    end
  end

  def update(index, player)
    self.cells[index.to_i-1] = player.token
  end

  def reset!
    self.cells=Array.new(9," ")
  end

end

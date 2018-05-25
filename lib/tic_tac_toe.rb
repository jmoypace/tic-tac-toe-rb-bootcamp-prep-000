def output
puts "Welcome to Tic Tac Toe!"
end
WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
def display_board(board)
  
  puts" #{board[0]} | #{board[1]} | #{board[2]} "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
 end 
 
 def input_to_index(user_input)
  
  user_input.to_i - 1;
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
     turn(board)
   end
    move(board, index, current_player(board))
    display_board(board)
end

def current_player(board)
  turn_count(board)%2==0?"X":"O"
end

def turn_count(board)
  board.count{|token| token =="X" || token =="O"}
  
end
def full?(board)
  board.all?{|token| token =="X"||token =="O"}
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
position_1=board[win_combo[0]]
position_2=board[win_combo[1]]
position_3=board[win_combo[2]]
if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
  end
end
false
end
def draw?(board)
!won?(board) && full?(board)
end
def over?(board)
  won?(board) || draw?(board)
end
def winner(board)
combo=won?(board)
 if(combo)
    board[combo[0]]
end
end

def play (board)
  until over?(board) 
  turn(board)
  won?(board)
  draw?(board)
end
if winner(board) =="X"
  puts "Congratulations X!"
  elsif winner(board) =="O"
  puts "Congratulations O!"
elsif draw?(board)
puts "Cats Game!"
end
end
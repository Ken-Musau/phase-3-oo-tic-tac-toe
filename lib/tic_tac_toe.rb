
class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
        puts "---------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
        puts "---------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end

    def input_to_index input
        input = input.to_i - 1
    end

    def move(board_index, player_token="X")
        @board[board_index] = player_token
    end

    def position_taken?(board_index)
        @board[board_index] != " "
    end

    def valid_move? board_index
        (0..8).include?(board_index) && @board[board_index] == " "
    end

    def turn_count
        @board.count { |position| position != " " }
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter a position (1-9):"
        input = gets.chomp
        index = input_to_index(input)
      
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          puts "Invalid move. Please try again."
          turn
        end
      end

      def won?
        WIN_COMBINATIONS.each do |combination|
          position1 = @board[combination[0]]
          position2 = @board[combination[1]]
          position3 = @board[combination[2]]
      
          if position1 == "X" && position2 == "X" && position3 == "X"
            return combination
          elsif position1 == "O" && position2 == "O" && position3 == "O"
            return combination
          end
        end
      
        false
      end
      
      def full?
        @board.all? { |position| position == "X" || position == "O" }
      end
      
      def draw?
        full? && !won?
      end
      
      def over?
        won? || draw?
      end
      
      def winner
        if combination = won?
          @board[combination[0]]
        end
      end

      def play
        until over?
          turn
        end
      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
end



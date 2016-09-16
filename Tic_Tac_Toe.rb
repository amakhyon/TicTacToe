class Grid
	
	def generate_grid #Generates 3x3 grid containing numbers to facilitate choosing
		@grid = [[1,2,3],[4,5,6],[7,8,9]]
		$moves = []
	end

	
	
	def print_grid
		@grid.each do |r|
  		puts r.each { |p| p }.join(" ")
		end
		puts" "
	end	

	def player_one_post_to_grid(move) #Modifies grid according to user choice
		
		 
		if move <= 3
			@grid[0][move - 1] = 'X'
		elsif move <=6 && move > 3
			@grid[1][move - 4] = 'X'
		elsif move <=9 && move > 6
			@grid[2][move - 7] = 'X'
		else
			error
		end
		print_grid			
    end
    

    def player_two_post_to_grid(movie) #makes the computer places a random move
    	if movie <= 3 
			@grid[0][movie - 1] = 'O'
		elsif movie <=6 && movie > 3
			@grid[1][movie - 4] = 'O'
		elsif movie <=9 && movie > 6
			@grid[2][movie - 7] = 'O'
		end
		print_grid
	end
    def error
    	puts "please type a number from 1 to 9! you entered #{@move} and its class is #{@move.class}"
    end	


end

class Play < Grid
	 
	def player_one_turn
		print_grid #display grid
		puts "player 1's turn, please type the number you want to place your move"
		@move = gets.chomp
		@move = @move.to_i
		return @move
		
	end
	def player_two_turn #return the move
		print_grid #display grid
		puts "player 2's turn, please type the number you want to place your move"
		@move_two = gets.chomp
		@move_two = @move_two.to_i
		return @move_two
		
	end
	def new_game
		@win,@computer_win = false
		generate_grid
		9.times do 
		break if @win || @computer_win #Break if 3 squares are completed by player1 or player2
		player_one_post_to_grid(player_one_turn)#player move
		player_one_win #checks for win after each move
		break if @win || @computer_win
		player_two_post_to_grid(player_two_turn)#computer random
		player_two_win #checks if computer won after each move
		end
		if @computer_win
			puts "player 2 is the man, player 1 is the bitch!"
		elsif @win
			puts "player 1 has fucked player 2 dry"	
		else 
			puts "its a draw...meh"
		end
	end
	def player_one_win #checks for player 1 win 
		#three rows 
		if @grid[0][0] == "X" && @grid[0][1] == "X" && @grid[0][2] == "X"
			@win = true
		elsif @grid[1][0] == "X" && @grid[1][1] == "X" && @grid[1][2] == "X"
			@win = true
		elsif @grid[2][0] == "X" && @grid[2][1] == "X" && @grid[2][2] == "X"
		#three coloumns
		elsif @grid[0][0] == "X" && @grid[1][0] == "X" && @grid[2][0] == "X"
			@win = true
		elsif @grid[0][1] == "X" && @grid[1][1] == "X" && @grid[2][1] == "X"
			@win = true
		elsif @grid[0][2] == "X" && @grid[1][2] == "X" && @grid[2][2] == "X"
			@win = true
		#1-9 diagonal 
		elsif @grid[0][0] == "X" && @grid[1][1] == "X" && @grid[2][2] == "X"
			@win = true
		#3-7 diagonal
		elsif@grid[0][2] == "X" && @grid[1][1] == "X" && @grid[2][0] == "X"
			@win = true
		end
	end
	def player_two_win #checks for player 2 win
		if @grid[0][0] == "O" && @grid[0][1] == "O" && @grid[0][2] == "O"
				@computer_win = true
			elsif @grid[1][0] == "O" && @grid[1][1] == "O" && @grid[1][2] == "O"
				@computer_win = true
			elsif @grid[2][0] == "O" && @grid[2][1] == "O" && @grid[2][2] == "O"
			#three coloumns
			elsif @grid[0][0] == "O" && @grid[1][0] == "O" && @grid[2][0] == "O"
				@computer_win = true
			elsif @grid[0][1] == "O" && @grid[1][1] == "O" && @grid[2][1] == "O"
				@computer_win = true
			elsif @grid[0][2] == "O" && @grid[1][2] == "O" && @grid[2][2] == "O"
				@computer_win = true
			#1-9 diagonal 
			elsif @grid[0][0] == "O" && @grid[1][1] == "O" && @grid[2][2] == "O"
				@computer_win = true
			#3-7 diagonal
			elsif@grid[0][2] == "O" && @grid[1][1] == "O" && @grid[2][0] == "O"
				@computer_win = true
			end
	end
end





game1 = Play.new
game1.new_game		






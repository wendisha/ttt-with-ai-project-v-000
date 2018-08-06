require "pry"
module Players
  class Computer < Player 
    def move(board, game=Game.new)
      choice = ""
      cells = board.cells
      corners = ["1", "3", "7", "9"]
      corners_state = [cells[0], cells[2], cells[6], cells[8]]
      my_token = game.current_player.token
      their_token = my_token == "X" ? "O" : "X" 
      me = []
      #binding.pry
      
      if board.turn_count == 0
  #Take a corner
        choice = corners.sample
      elsif board.turn_count == 2
  #Take another corner
        choice = corners.sample
        until board.valid_move?(choice)
          choice = corners.sample
        end
        choice
      elsif choice = cells.sample
          until board.valid_move?(choice)
            choice = cells.sample
          end
          choice
      end
end
end
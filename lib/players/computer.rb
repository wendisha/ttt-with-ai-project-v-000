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
      binding.pry
      
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
      elsif board.turn_count == 4
  #Check if its possible to win
        corners_state.each_with_index do |corner, index| 
          if corner == my_token
        
        
        if me.include?("1") && me.include?("3") && !board.taken?("2")
          choice = "2"
        elsif me.include?("1") && me.include?("9") && !board.taken?("5")
          choice = "5"
        elsif me.include?("1") && me.include?("7") && !board.taken?("4")
          choice = "4"
        elsif me.include?("3") && me.include?("7") && !board.taken?("5")
          choice = "5"
        elsif me.include?("3") && me.include?("9") && !board.taken?("6")
          choice = "6"
        elsif me.include?("7") && me.include?("9") && !board.taken?("8")
          choice = "8"
          
  #If it's not possible to win, it's because opponent blocked computer, so take another (or the remaining corner), forking 2 possible winning situations.
        else choice = corners.sample
          until board.valid_move?(choice)
            choice = corners.sample
          end
          choice
        end
      elsif board.turn_count == 6
  #Win!!!!!!!!!!!!!!!
        me = corners_state.select {|corner| corner == my_token}
        if me.include?("1") && me.include?("3") && !board.taken?("2")
          choice = "2"
        elsif me.include?("1") && me.include?("9") && !board.taken?("5")
          choice = "5"
        elsif me.include?("1") && me.include?("7") && !board.taken?("4")
          choice = "4"
        elsif me.include?("3") && me.include?("7") && !board.taken?("5")
          choice = "5"
        elsif me.include?("3") && me.include?("9") && !board.taken?("6")
          choice = "6"
        elsif me.include?("7") && me.include?("9") && !board.taken?("8")
          choice = "8"
        else choice = cells.sample
          until board.valid_move?(choice)
            choice = cells.sample
          end
          choice
        end
      else 
 #When playing second, check if the center square is free, if so, take it.
        if !board.taken?("5")
          choice = "5"
          them = corners_state.select {|corner| corner == their_token}
          if them.include?("1") && me.include?("3") && !board.taken?("2")
            choice = "2"
          elsif them.include?("1") && me.include?("7") && !board.taken?("4")
            choice = "4"
          elsif them.include?("3") && me.include?("9") && !board.taken?("6")
            choice = "6"
          elsif them.include?("7") && me.include?("9") && !board.taken?("8")
            choice = "8"
          else choice = cells.sample
            until board.valid_move?(choice)
            choice = cells.sample
            end
            choice
          end 
        else choice = cells.sample
          until board.valid_move?(choice)
            choice = cells.sample
          end
          choice
        end
      end
    end    
  end
end
# frozen_string_literal: true

# Class which holds data state and logic
class Board
  def initialize
    @grid = { 'A1'=> '', 'B1'=> '', 'C1'=> '',
      'A2'=> '', 'B2'=> '', 'C2'=> '',
      'A3'=> '', 'B3'=> '', 'C3'=> '' }
    end
    def play(player_and_location)
      player_piece = player_and_location[0]
      grid_location = player_and_location[1,2]
      unless @grid.key?(grid_location) == true
        raise 'Not a valid square. Please choose another one.'
      end
      if @grid[grid_location] == ''
        @grid[grid_location] = player_piece
        return @grid[grid_location]
      else
        raise 'Already played. Choose another square.'
      end
    end
  end

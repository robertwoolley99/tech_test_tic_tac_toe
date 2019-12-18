# frozen_string_literal: true

# Class which holds data state and logic
class Board
  def initialize
    @grid = { 'A1' => '', 'B1' => '', 'C1' => '',
              'A2' => '', 'B2' => '', 'C2' => '',
              'A3' => '', 'B3' => '', 'C3' => '' }
  end

  def play(player_and_location)
    player_piece = player_and_location[0]
    grid_location = player_and_location[1, 2]
    validate_move(player_piece, grid_location)
  end

  def validate_move(player_piece, grid_location)
    unless @grid.key?(grid_location) == true
      raise 'Not a valid square. Please choose another one.'
    end

    unless @grid[grid_location] == ''
      raise 'Already played. Choose another square.'
    end

    @grid[grid_location] = player_piece
  end
end

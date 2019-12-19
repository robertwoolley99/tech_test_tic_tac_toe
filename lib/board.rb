# frozen_string_literal: true

# Class which holds data state and logic
class Board
  def initialize
    @grid = { 'A1' => '', 'B1' => '', 'C1' => '',
              'A2' => '', 'B2' => '', 'C2' => '',
              'A3' => '', 'B3' => '', 'C3' => '' }

    @winning_lookup = %w[XX A1 A2 A3 B1 B2 B3 C1 C2 C3 A1 B1 C1 A2 B2 C2 A3\
                         B3 C3 A1 B2 C3 C1 B2 A3]
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

  def winner
    win_scan
  end

  def win_scan
    (1..24).step(3) do |element|
      next unless @grid[@winning_lookup[element]] != ''

      next unless @grid[@winning_lookup[element]] == \
                  @grid[@winning_lookup[element + 1]]
                  
      if @grid[@winning_lookup[element + 2]] \
         == @grid[@winning_lookup[element]]
        output = @grid[@winning_lookup[element]] + ' wins'
        return output
      end
    end
    'no winner'
  end

  # def win_scan
  #
  #
  #   if @grid['A1'] == @grid['A3'] && @grid['A2'] == @grid['A1'] && \
  #      @grid['A1'] != ''
  #     @grid['A1'] + ' wins'
  #   else 'no winner'
  #   end
  # end
end

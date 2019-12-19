# frozen_string_literal: true

# Class which holds data state and logic
class Board
  def initialize
    @grid = { 'A1' => '', 'B1' => '', 'C1' => '',
              'A2' => '', 'B2' => '', 'C2' => '',
              'A3' => '', 'B3' => '', 'C3' => '' }

    @winning_lookup = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3 A1 B1 C1 A2 B2 C2 A3 B3 C3\
                         A1 B2 C3 C1 B2 A3]

    @game_status = ''
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

    unless player_piece.include?('X') || player_piece.include?('O')
      raise 'Sorry, noughts and crosses only. Choose again'
    end

    @grid[grid_location] = player_piece
  end

  def winner
    @game_status = 'No winner'
    (0..23).step(3) do |element|
      next unless @grid[@winning_lookup[element]] != ''

      next unless @grid[@winning_lookup[element]] == \
                  @grid[@winning_lookup[element + 1]]

      check_winner(element)
    end
    @game_status
  end

  def check_winner(element)
    if @grid[@winning_lookup[element + 2]] \
      == @grid[@winning_lookup[element]]
      @game_status = @grid[@winning_lookup[element]] + ' wins'
    end
  end

end

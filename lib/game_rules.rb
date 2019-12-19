# frozen_string_literal: true

# Class to determine game rules
class GameRules
  def initialize
    @winning_lookup = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3 A1 B1 C1 A2 B2 C2 A3 B3 C3\
                         A1 B2 C3 C1 B2 A3]
  end

  def winner(grid)
    @grid = grid
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
    if ! @grid.values.any?(&:empty?) && @game_status == 'No winner'
      @game_status = 'Draw'
    end
  end
end

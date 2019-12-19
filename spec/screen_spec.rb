# frozen_string_literal: true

require 'screen'

describe Screen do
  context 'Check that it renders the board with a key' do
    it 'can prepare a mixed board' do
      grid = { 'A1' => 'X', 'B1' => 'O', 'C1' => 'X',
               'A2' => 'X', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'X', 'B3' => 'X', 'C3' => 'O' }
      screen = Screen.new(grid)
      expect(screen.image).to eq("ABC\n1XOX\n2XOO\n3XXO")
    end
  end
end

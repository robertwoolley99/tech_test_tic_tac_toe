# frozen_string_literal: true

require 'game_rules'

describe GameRules do
  let(:rules) { GameRules.new }
  context 'Detect if we have a winner from plays' do
    it 'detects a winner X from the left vertical' do
      grid = { 'A1' => 'X', 'B1' => 'O', 'C1' => 'X',
               'A2' => 'X', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'X', 'B3' => 'X', 'C3' => 'O' }
      expect(rules.winner(grid)).to eq('X wins')
    end
    it 'detects a winner O from the left vertical' do
      grid = { 'A1' => 'O', 'B1' => 'O', 'C1' => 'X',
               'A2' => 'O', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'O', 'B3' => 'X', 'C3' => 'O' }
      expect(rules.winner(grid)).to eq('O wins')
    end
    it 'detects a winner X from the middle vertical' do
      grid = { 'A1' => 'O', 'B1' => 'X', 'C1' => 'X',
               'A2' => 'O', 'B2' => 'X', 'C2' => 'O',
               'A3' => 'O', 'B3' => 'X', 'C3' => 'O' }
      expect(rules.winner(grid)).to eq('X wins')
    end
  end
end

describe GameRules do
  let(:rules) { GameRules.new }
  context 'Further winner checks' do
    it 'detects a winner O from the southwest diagonal.' do
      grid = { 'A1' => 'O', 'B1' => 'X', 'C1' => 'O',
               'A2' => 'O', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'O', 'B3' => 'O', 'C3' => 'O' }
      expect(rules.winner(grid)).to eq('O wins')
    end
  end
end

describe GameRules do
  let(:rules) { GameRules.new }
  context 'Check that we have no winner too!' do
    it 'finds no winner when play on one line' do
      grid = { 'A1' => 'O', 'B1' => 'X', 'C1' => 'O',
               'A2' => 'X', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'X', 'B3' => 'O', 'C3' => '' }
      expect(rules.winner(grid)).to eq('No winner')
    end
    it 'finds a draw when we have stalemate' do
      grid = { 'A1' => 'O', 'B1' => 'X', 'C1' => 'O',
               'A2' => 'X', 'B2' => 'O', 'C2' => 'O',
               'A3' => 'X', 'B3' => 'O', 'C3' => 'X' }
               expect(rules.winner(grid)).to eq('Draw')
    end
  end
end

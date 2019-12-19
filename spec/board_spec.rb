# frozen_string_literal: true

require 'board'

describe Board do
  let(:board) { Board.new }
  context 'Ensure that the board is configured ok' do
    it 'accepts a move' do
      expect(board.play('XA1')).to eq('X')
    end
    it 'throws an error if a space is already occupied' do
      board.play('XA1')
      expect { board.play('OA1') }.to \
      raise_error('Already played. Choose another square.')
    end
    it 'throws an error if we try and play to a non-existent square' do
      expect { board.play('XA9') }.to \
        raise_error('Not a valid square. Please choose another one.')
    end
  end
end

describe Board do
  let(:board) { Board.new }
  context 'Detect if we have a winner from plays' do
    it 'detects a winner X from the left vertical' do
      board.play('XA1')
      board.play('XA2')
      board.play('XA3')
      expect(board.winner).to eq('X wins')
    end
    it 'detects a winner O from the left vertical' do
      board.play('OA1')
      board.play('OA2')
      board.play('OA3')
      expect(board.winner).to eq('O wins')
    end
  end
end

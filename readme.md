# Read me for Tic Tac Toe Tech Test

## Installation Instructions
Clone the git repo to your local machine.

Then run bundle install to ensure that rubocop and simplecov are installed.


## Contents
This program contains the logic for tic tac toe - noughts and crosses plus a renderer.

The board class holds the game state and validates moves.  
Edge cases caught by the board class are:   
a) Player trying to go into a cell which is already occupied.   
b) Player trying to go to a cell which doesn't exist.   
c) Player trying to put anything other than an X or O into a cell (this is noughts and crosses!). 
   
   
Board  also calls the game_rules class which when presented with a board will return one of three messages:

a) No winner - game still in play.   
b) [X/O] wins - shows which player wins.   
c) Draw - all nine cells are full and there is no winner.  

Board will detect a win on horizontals, verticals or the two diagonals.

## Tests
   The programe contains unit tests for each class.  In addition there is a defacto function test on the Board object which involves making moves and seeing if a winner is detected.
      
      
Tests using mocking as required, with a hash being directly injected into the Game Rules class for testing.




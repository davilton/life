# Conway's Game of Life

### Design Overview
My approach uses a Cell class and a Grid class.  Each game is an instance of Grid and it is populated with instances of Cell, initialized to be dead.  After the cells in the initial conditions are marked as alive, the generation is cycled and all cells are evaluated and displayed.  The generations argument will determine how many times the game board is cycled.

I have used Ruby for my implementation because it is my strongest language.  This code can be executed with several inputs or with none and uses default values. The curses library is used to animate the output to STDOUT, which was recently extracted out of the standard ruby library into a separate gem.  

RSpec is utilized for testing with factory_girl instead of fixtures.  I have used Rspec extensively and factory_girl is great for creating test objects without persisting to the database, which lends to speedier tests. I have written tests for the core functionality and all are passing.

### Dependencies
Assuming ruby is already installed
```
  $ gem install rspec
  $ gem install factory_girl
  $ gem install curses
```
### Run
Examples:
```
  $./run_life.rb 25 50 glider.txt
```
```
  $ ./run_life.rb
```  

Optional Arguments:
```
  $ ./run_life.rb [size] [generations]
```
```
  $ ./run_life.rb [size] [generations] [initial_conditions.txt]
```
### Tests
From the root directory of the project, run:
```  
  $ rspec
```
### Assumptions
No arguments produces a population of 5 live cells, on a grid 15x15 and cycles through 30 generations.
There isn't any error checking on the input values, or on the input file.





# Conway's Game of Life

### Design Overview
I have used Ruby for my implementation because it is my strongest language.  This code can be executed with several inputs or with none and use default values. I am using the curses library to animate the output to STDOUT. 

RSpec is utilized for testing with factory_girl instead of fixtures.  I have used Rspec extensively and factory_girl is great for creating test objects without persisting to the database, which lends to speedier tests. I have written tests for the core functionality and all are passing.

### Dependencies
Assuming ruby is already installed
  $ gem install rspec
  $ gem install factory_girl
  $ gem install curses

### Run
  $ ./run_life.rb
OR
  $ ./run_life.rb size generations
OR
  $ ./run_life.rb size generations initial_conditions.txt

### Tests
From the root directory of the project, run:
  $ rspec

### Assumptions
No arguments produces a population of 5 live cells, on a grid 15x15 and cycles through 30 generations.




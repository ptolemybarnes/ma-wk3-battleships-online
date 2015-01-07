Feature: interact with board
  In order to play battleships
  As a player wanting to shot things
  I want to interact with the board

  Scenario: A starting board
    Given I am on the boardpage
    Then I should observe a cell "C5"

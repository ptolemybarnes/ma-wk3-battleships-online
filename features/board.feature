Feature: interact with board
  In order to play battleships
  As a player wanting to shot things
  I want to interact with the board

  Scenario: A starting board
    Given I am on the boardpage
    Then I should observe a cell "C5"

  Scenario: Shoot at the board and miss
    Given I am on the boardpage
    Then I should not see "You MISS!"
    When I shoot at a cell "F5"
    Then I should see "You MISS!"

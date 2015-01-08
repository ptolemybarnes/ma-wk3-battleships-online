Feature: interact with board
  In order to play battleships
  As a player wanting to shot things
  I want to interact with the board

  Scenario: A starting board
    Given I am on the board page
    Then I should observe a cell "C5"

  Scenario: Shoot at the board
    Given I am on the board page having placed an aircraft carrier

  Scenario: Missing
    Given I am on the board page
    Then I should not see "You MISS!"
    When I shoot at a cell "F5"
    Then I should see "You MISS!"

  Scenario: Shooting at the same cell twice
    Given I am on the board page
    Then I shoot at a cell "C1"
    And I shoot at a cell "C1"
    Then I should see "You can't shoot at the same cell twice!"

  Scenario: All enemy ships have been sunk
    Given I am on the board page
    When I shoot at a cell "A1" with ship
    Then I should see "Hit"
    And I shoot at a cell "A2" with ship
    And I shoot at a cell "A3" with ship
    And I shoot at a cell "A4" with ship
    And I shoot at a cell "A5" with ship
    Then I should see "ALL ENEMY SHIPS SUNK, YOU WIN!"



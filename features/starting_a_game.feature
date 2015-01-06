Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering the first player
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"
    Then I enter Ptolemy
    Then I click submit
    And I see Welcome, Ptolemy. You have been registered for the game.

  Scenario: Registering the second player
    Given I am on the newgame page
    When I fill in "p2name" with "Clint"
    Then I press "ptwosubmit"
    And I should see "Welcome, Clint. You have been registered for the game."

  Scenario: Player did not enter any name
    Given I am on the newgame page
    When I fill in "name" with "" 
    And I click submit
    Then I should see "What's your name?" 

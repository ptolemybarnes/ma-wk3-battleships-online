Feature: Placing the ships
  In order to start playing battleships
  As a player with a name
  I want to place the ships

  Scenario: I place an aircraft carrier
    Given I am on the fleet launcher page to place an aircraft carrier
    And I choose "A1"
    And I choose "horizontally"
    And I press "submit"

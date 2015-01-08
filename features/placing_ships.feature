Feature: Placing the ships
  In order to start playing battleships
  As a player with a name
  I want to place the ships

  Scenario: Player 1 places aircraft carrier
    Given I am on the fleetlauncher page
    When I choose "coords" within "A1"
    And I choose "direction" within "horizontal"

  Scenario: 
Feature: Drive RIISKata using Cucumber

Scenario: The app is launched
    Given the app is launched
    When I touch the Ground Button
    Then I should see an alert marked OK
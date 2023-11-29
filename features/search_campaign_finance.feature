Feature: search for campaign finance

  As a user of the app
  So that I can easily find out campaign finance information
  I want to search campaign finance information

Background: On the page of campaign finance search
  
  Given I am on the campaign finance search page

  Scenario: Search campaign finance
    Then I should see "Cycle"
    And I should see "Category"
    # Then I select "2020" from "Cycle"
    # And I select "Contribution Total"
    # And I press "Search"
Feature: Display a Representative’s Profile Page

  As a politically engaged user
  So that I can make informed decisions and stay up to date with a representative of choice
  I want to access information about a representative, including name, OCD ID, office, contact address, political party, and a profile photo
Background: representatives have been added to the database
  Given Kamala D. Harris exists
Scenario: View Representative's Profile Page
  When I visit Kamala D. Harris' profile page
  Then I should see Kamala D. Harris' name
  And I should see Kamala D. Harris' OCD ID
  And I should see Kamala D. Harris' office
  And I should see Kamala D. Harris' contact address
  And I should see Kamala D. Harris' political party
  And I should see Kamala D. Harris' profile photo

Scenario: Access Representative's Profile from Search
  Given I visit the Representatives page
  When I add a California address in the Search page
  Given Joseph R. Biden exists
  When I click on Joseph R. Biden's Profile link in the search results
  Then I should see Joseph R. Biden's name
  And I should see Joseph R. Biden's OCD ID
  And I should see Joseph R. Biden's office
  And I should see Joseph R. Biden's contact address
  And I should see Joseph R. Biden's political party
  And I should see Joseph R. Biden's profile photo

Scenario: Access Representative's Profile from News Items
  When I read a news item mentioning a representative
  And I click on the representative's name in the news item
  Then I should be redirected to the representative's profile page
  And I should see the representative's name
  And I should see the representative's OCD ID
  And I should see the representative's office
  And I should see the representative's contact address
  And I should see the representative's political party
  And I should see a representative's profile photo
  
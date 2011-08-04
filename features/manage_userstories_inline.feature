Feature: Manage userstories_inline
  In order to manage stories easily
  As a product owner
  I want to be able to manage modifications in the same page
  
  Background:
  	Given I am on the login page
  	When I fill in "username" with "jsmith"
  	And fill in "password" with "jsmith"
  	And press "Login »" 
  	And I go to the onlinestore project home  	
  	And I follow "User-Stories"
  	Then show me the page
  	
  @javascript
  Scenario: Add issue inline
    Given I am on the userstories page
    And I press "Create"
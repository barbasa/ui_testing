@selenium
Feature: Jobs browse pages
    In order to show the browse functionality
    As a user
    I want to browse through jobs

Scenario Outline: Browse through jobs category from the home page
    Given I am on the jobs <country> home page
    Then I should be able to get to the browse categories page

Examples:
     | country |
     | AU      |
     | BR      |
     | CA      |
     | DE      |
     | UK      |
     | ZA      |

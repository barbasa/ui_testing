@selenium
Feature: Advanced Jobs Search
    In order to show the advanced search functionality
    As a user
    I want to search for jobs

Scenario Outline: Search for jobs from the advanced search page
    Given I am on the jobs <country> advanced search page
    When I search for jobs with this criteria: <radious> from <location>, <contract_type>, <hours>, <freshness_days>, <all_words>, <exact_match>, <or_matches>, <exclude_match>, <include_in_title>, <company>, <per_page>, <sorting>
    Then I should see at least <results> results

Examples:
   |country | radious | location |contract_type| hours      |freshness_days|all_words|exact_match|or_matches|exclude_match|include_in_title|company |results|per_page|sorting |
   | UK     | 50      | london   |permanant    | fulltime   | 1            | it      | OFF       | junior   | OFF         | OFF            | OFF    | 10    | 10     |relevant|

#   | UK     | 5       | london   |permanent    | fulltime   | 1            | perl    | OFF       | ruby     | java        | manager        | google | 1000  | 10     |relevant|
#   | UK     | 25      | london   |permanent    | fulltime   | 1            | OFF     | ruby      | senior   | perl        | OFF            | OFF    | 2000  | 0      |recent  |
#   | UK     | 10      | london   |contract     | OFF        | 3            | java    | OFF       | junior   | OFF         | project        | OFF    | 2000  | 25     |salary_h|
#   | UK     | 100     | london   |OFF          | OFF        | 0            | java    | OFF       | junior   | OFF         | project        | OFF    | 1     | 50     |salary_l|
#   | DE     | 5       | berlin   |permanent    | fulltime   | 7            | OFF     | OFF       | mid      | C           | OFF            | IBM    | 500   | 0      |salary_h|
#   | DE     | 0       | OFF      |permanent    | fulltime   | 7            | C       | python    | OFF      | perl        | OFF            | OFF    | 500   | 0      |recent  |

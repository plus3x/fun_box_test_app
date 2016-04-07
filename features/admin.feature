Feature: Admin

  @javascript
  Scenario: Update currency
    Given I'm on admin page
    When I update currency with value "23.45" and to "31.12.2016"
    Then currency is "23.45"
    When I update currency with value "23.45" and to "01.01.2016"
    Then currency is not "23.45"

Feature: explain how to use the app

  Scenario: user just runs the script without parameters
    Given Ted has no idea how to use the app
    When he tries to just run it with no parameters
    Then he sees usage instructions

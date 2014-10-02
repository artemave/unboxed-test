Feature: find out someone's favourite programming language based on github profile

  Scenario: get favourite language of existing github user
    Given Walter published some Ruby code under his github account
    When Jesse wants to find out what is Walter's programming language of choice
    Then he can see that it is a Ruby

  Scenario: attempt to run for non-existing github user
    Given Jon Snow does not have a github account
    When Ned Stark wants to find out what is Jon's programming language of choice
    Then he sees an error explaining that Jon Snow is not a github user

  Scenario: attempt to run for user with no repos
    Given Earl has no repos on github
    When Randy wants to find out what is Earl's programming language of choice
    Then he sees we can't really tell

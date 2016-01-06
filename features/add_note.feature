Feature: add note
In order to add new note
As a users
I want to be able to add my own notes

Background: Logged as an existing user

Scenario: Add a note
    Given I am on "notes"
    When I follow "New Note"
    Then I should be on "new_note"
    When I fill in "content" with "diary"
    When I press "Create note"
    Then I should be on "edit_note"
    Then I should see Note was successfully created
    Then I should see diary
    When I follow "edit"
    Then I should be on the edit page of note "diary"
    When I follow "back"
    Then I should be on "notes"

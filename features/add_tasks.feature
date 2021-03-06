Feature: add task
In order to add new task
As a users
I want to be able to add my own tasks

Background: Logged as an existing user

Scenario: Add a task
    Given I am on "tasks"
    When I follow "New task"
    Then I should be on "new_task"
    When I fill in "content" with "diary"
    When I press "Create task"
    Then I should be on "edit_task"
    Then I should see task was successfully created
    Then I should see diary
    When I follow "edit"
    Then I should be on the edit page of task "diary"
    When I follow "back"
    Then I should be on "tasks"

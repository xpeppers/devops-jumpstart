Feature: Blog
  In order to keep a blog
  As a user
  I want to publish a new post

  @no-txn
  @no-database-cleaner
  Scenario: Publish a post
    Given I am on "/posts"
    And I follow "New Post"
    When I fill in "Title" with "Test title"
    And I fill in "Body" with "Test body"
    And I press "Submit"
    Then I see "Post successfully created"

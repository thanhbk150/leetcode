# VISIBLE_CHROME=true bundle exec cucumber features/user.feature

@javascript

  Feature: User

    Background: User Authenticates
      Given There is an account with login "thanh"
      Given I log in as "thanh"

    Scenario: Add new user & Edit user
      When I visit the user page
      And I click a new user button
      And I fill the user form as the following:
        | First name  | Thanh               |
        | Last name   | Nguyen              |
        | Login       | thanhbk150          |
        | Email       | thanhbk150@gmail.com|
        | Password    | 123456              |
      And I click a save user button

      When I visit the user page
      Then I see a list of user as the following:
        | # | First Name  | Last Name  | Login      | Email                 |
        | 1 | Factory     | Bot        | thanh      | thanh@example.com     |
        | 2 | Thanh       | Nguyen     | thanhbk150 | thanhbk150@gmail.com  |

      And I click an edit user button number "2"
      And I fill the user form as the following:
        | First name  | Thanh2               |
        | Last name   | Nguyen2              |
        | Login       | thanhbk1502          |
        | Email       | thanhbk1502@gmail.com|
        | Password    | 123456               |
      And I click a save user button

      When I visit the user page
      Then I see a list of user as the following:
        | # | First Name  | Last Name  | Login      | Email                 |
        | 1 | Factory     | Bot        | thanh      | thanh@example.com     |
        | 2 | Thanh2      | Nguyen2    | thanhbk1502| thanhbk1502@gmail.com |

    Scenario: User form invalid
      When I visit the user page
      And I click a new user button
      And I click a save user button

      Then I see an error messages in the user form as the following:
        | Login    | can't be blank |
        | Email    | can't be blank |
        | Password | can't be blank |

      And I fill the user form as the following:
        | First name | Thanh              |
        | Last name  | Nguyen             |
        | Login      | thanh              |
        | Email      | thanh              |
        | Password   | 123456             |
      And I click a save user button

      Then I see an error messages in the user form as the following:
        | Login    | has already been taken |
        | Email    | is invalid             |

      And I fill the user form as the following:
        | Login     | thanhbk150              |
        | Email     | thanh@example.com  |
      And I click a save user button

      Then I see an error messages in the user form as the following:
        | Email    | has already been taken |

      And I fill the user form as the following:
        | Email     | thanhbk150@gmail.com |
        | Password  | 123456               |
      And I click a save user button

      When I visit the user page
      Then I see a list of user as the following:
        | # | First Name  | Last Name  | Login      | Email                 |
        | 1 | Factory     | Bot        | thanh      | thanh@example.com     |
        | 2 | Thanh       | Nguyen     | thanhbk150 | thanhbk150@gmail.com  |

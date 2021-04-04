Feature: Show Orders

    Signed in and unsigned users should be able to 
    see all the orders in the platform

    Background: 
        Given there are orders with products
        When I visit the homepage
        And I click "Orders"

    Scenario: Show All Orders
        Then I should see the list of orders

    Scenario: Show One Order
        And I click the first order
        Then I should see the order information
        
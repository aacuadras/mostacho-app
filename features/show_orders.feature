Feature: Show Orders

    Signed in users should be able to 
    see all the orders in the platform

    Background: 
        Given there are orders with products
        And I sign in
        When I visit the homepage
        And I click "Órdenes"

    Scenario: Show All Orders
        Then I should see the list of orders

    Scenario: Show One Order
        And I click the first order
        Then I should see the order information
        
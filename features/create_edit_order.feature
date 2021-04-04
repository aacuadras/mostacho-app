Feature: Create and Edit an Order

    Users should be able to create and edit the information for an order

    Background: 
        Given there are orders with products
        When I visit the homepage
        
    Scenario: Adding an Order
        When I click "New Order"
        And I fill out the new order information
        And I click "Create Order"
        Then I should see the new order information

    Scenario: Editing an Order
        When I click "Orders"
        And I click the first order
        And I click "Edit"
        And I update the order information
        And I click "Update Order"
        Then I should see the updated order information
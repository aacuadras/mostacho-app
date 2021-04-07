Feature: Create and Edit an Order

    Users should be able to create and edit the information for an order

    Background: 
        Given there are orders with products
        And I sign in
        When I visit the homepage
        
    @javascript    
    Scenario: Adding an Order
        When I click "Nueva Orden"
        And I fill out the new order information
        And I click "Crear Orden"
        Then I should see the new order information

    Scenario: Editing an Order
        When I click "Órdenes"
        And I click the first order
        And I click "Editar"
        And I update the order information
        And I click "Actualizar Orden"
        Then I should see the updated order information

    Scenario: Updating an Order Status
        When I click "Órdenes"
        And I click "Cambiar Estado"
        Then I should see the updated status for the order
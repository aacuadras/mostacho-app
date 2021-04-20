Feature: Create and Edit a Product

    Users should be able to edit the name and price of a product

    Background: 
        Given there are products
        And I sign in
        When I visit the homepage

    Scenario: Adding a Product
        And I click "Nuevo Producto"
        And I fill in the product information
        And I click "Crear Producto"
        Then I should see the product information
        
    Scenario: Editing a Product
        And I click edit for the first product
        And I update the name of the product
        And I click "Editar"
        Then I should see the new name of the product
Feature: Create and Edit a Product

    Users should be able to edit the name and price of a product

    Background: 
        Given there are products
        When I visit the homepage

    Scenario: Adding a Product
        And I click "New Product"
        And I fill in the product information
        And I click "Create Product"
        Then I should see the product information

    Scenario: Editing a Product
        And I click the first product
        And I click "Edit"
        And I update the name of the product
        And I click "Update Product"
        Then I should see the new name of the product
Feature: Show Products

    Signed in and unsigned users should be able to 
    see all the products in the platform

    Background: 
        Given there are products
        When I visit the homepage        

    Scenario: Show All Products
        Then I should see the list of products

    Scenario: Show One Product
        And I click the first product
        Then I should see the name and price of the product
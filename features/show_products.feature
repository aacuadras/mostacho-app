Feature: Show Products

    Signed in and unsigned users should be able to 
    see all the products in the platform

    Scenario: Show All Products
        Given there are products
        When I visit the homepage
        Then I should see the list of products
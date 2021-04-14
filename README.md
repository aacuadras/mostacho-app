# Mostacho App
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/aacuadras/mostacho-app/Rails) 
![Lines of code](https://img.shields.io/tokei/lines/github/aacuadras/mostacho-app) 
![GitHub last commit](https://img.shields.io/github/last-commit/aacuadras/mostacho-app) 
![Rails Version](https://img.shields.io/badge/rails--version-6.1.3-blue) 

(Ruby on Rails)[https://rubyonrails.org/] application to manage orders and inventory of products. Users cannot register for the app for security reasons, but data can be seeded to the application using. 

```ruby 
User.create(name: "<YOUR_NAME>", password: "<YOUR_PASSWORD>")
```

## Products
At simple glance the application looks like a list of products, but a user has to sign in first for it to create, update or delete those products. Images for the products are uploaded to Amazon S3 and Amazon CloudFront is used for faster delivery of content in a production environment.

## Orders
Only signed-in users can access the actions in this controller, since the application was made for a small business to keep track of their order status.

## Testing
Testing is provided by [GitHub Actions](https://github.com/features/actions), using a custom Rails workflow to run [RSpec](https://github.com/rspec/rspec-rails) model and request tests, while also running [Cucumber](https://github.com/cucumber/cucumber-rails) tests. Tests are run everytime there is a commit to the master branch and in every pull requests, but PRs are only used for third-party API integrations. 

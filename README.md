Sample ECommerce Application:

Created using Ruby 2.5 and rails 5.2
Requirements:

# Description
Build a simple e-commerce store that sells purely electronic products/files (for example, PDFs)
using Ruby on Rails.
Main features:
- Separate user role for admins
- Admin should be able to manage the products inventory, view orders, user information on
customers
- There should be categories that can be dynamically created by the admin (i.e. Science Fiction),
and all products (PDFs) should be assigned to a category.
- Separate user role for customers
- Customers should be allowed to purchase items only if they are registered users and
should be able to track status of their orders.
- No need to implement a payment gateway, instead use Twillio Authy for 2-factor authentication
during a purchase. If 2-factor authentication is successfull, you should email the customer
the product. It should support both Authy OneTouch and Authy SoftToken (as fallback)
- It should use standard practices for a shopping cart, and have appropriate search (using
Solr) and filters on product pages (i.e. by category, by price)
- Website should be simple and easy to navigate.(Use Bootstrap for front-end)

# Technical requirements:
- Use SASS for CSS styling
- Use Devise for authentication
- Use Postgres as the database engine
- Have the code hosted on GitHub with full history of creation (since initial commit) and have a
demo deployed on a server (Heroku, or any server of your choice)
- Have a clean documentation (Readme file on GitHub), as well as a short screencast, going
through the project and explaining all the functionalities.
- Have a set of Rspec tests for all the main modules (all tests must pass successfully in order
for the submission to be considered)


Everything Above is implemented.

# Steps to run the application.
- clone the repository in the local.
  `` git clone git@github.com:raviskit/Sample_ecommerce_app.git ``
- get into local project folder by `cd Sample_ecommerce_app`
- Run Bundle, `bundle install`
- Create and setup DB.
    ` rake db:setup ` #  this will create, migrate and seed data into database.
- Setup solr. This app uses Solr for search, make sure solr is installed and running.
  `bundle exec rake sunspot:solr:start`
- Finally start the server using `rails server` and hit http://localhost:3000

App wasn't able to deploy to Heroku as Websolr was not available for free.

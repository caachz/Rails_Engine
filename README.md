## Rails Engine

# Background and Description
Rails engine is a basic ecommerce API that exposes endpoints for all crud functionality and advanced business logic endpoints. It is built to communicate with a prebuilt frontend called Rails Driver.

# Implementation Instructions
To set up locally with front end Rails Driver:

Clone down this repository and the front end of the application at https://github.com/caachz/rails_driver.
Run bundle install on rails engine.
Run rails db:{create,migrate,seed} to setup the database on rails engine.
Run rails s to localhost:3000.
Navigate to the cloned down Rails Driver and run rails s to localhost:3001.
open localhost:3001 in your browser.

To set up locally using a tool like Postman:
You can only clone down Rails Engine.
Run bundle install on rails engine.
Run rails db:{create,migrate,seed} to setup the database on rails engine.
Run rails s to localhost:3000.
Open a tool like postman and make any of the following requests.

# Endpoints

Restful Resources for Merchants and Items: 
  
  Index: \n
    GET /api/v1/<resource>
  
  <pre><code>{ 
    "data": [
        {
            "id": "1",
            "type": "merchant",
            "attributes": {
                "id": 1,
                "name": "Schroeder-Jerde"
            }
        },
        {
            "id": "2",
            "type": "merchant",
            "attributes": {
                "id": 2,
                "name": "Klein, Rempel and Jones"
            }
        },
        {
            "id": "3",
            "type": "merchant",
            "attributes": {
                "id": 3,
                "name": "Willms and Sons"
            }
        }
      ]
    }</pre></code>
  
  Show: 
    GET /api/v1/<resource>/:id
  
  Create: 
    POST /api/v1/<resource>
  
  Update: 
    PATCH /api/v1/<resource>/:id
  
  Destroy: 
    DELETE /api/v1/<resource>/:id
  
 Relationship resources:
 
  Items from a merchant:
   GET /api/v1/merchants/:id/items
   
  Merchant that belongs to an item:
   GET /api/v1/items/:id/merchant

Find endpoints: 

  Returns a single resource matching attributes:
    GET /api/v1/<resource>/find?<attribute>=<value>
  
  Returns all resources matching attributes:
    GET /api/v1/<resource>/find_all?<attribute>=<value>
  
 Buiness Intelligence endpoints:
 
  Merchants with the most revenue: 
    GET /api/v1/merchants/most_revenue?quantity=x
    
  Merchants with most items sold:
    GET /api/v1/merchants/most_items?quantity=x
    
  Revenue accross date range: 
    GET /api/v1/revenue?start=<start_date>&end=<end_date>
    
  Revenue for a merchant: 
    GET /api/v1/merchants/:id/revenue
  
  
  
  
  
Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
  
  Index: <br />
    GET /api/v1/merchants<br />
    GET /api/v1/items<br />
  
  <pre><code> { 
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
  
  Show: <br />
    GET /api/v1/merchants/:id<br />
    GET /api/v1/items/:id<br />
    
     <pre><code> {
    "data": {
        "id": "3",
        "type": "merchant",
        "attributes": {
            "id": 3,
            "name": "Willms and Sons"
        }
    }
}</pre></code>
  
  Create: <br />
    POST /api/v1/<resource><br />
  
  <pre><code></pre></code>
  
  Update: <br />
    PATCH /api/v1/<resource>/:id<br />
  
  <pre><code></pre></code>
  
  Destroy: <br />
    DELETE /api/v1/<resource>/:id<br />
  
  <pre><code></pre></code>
  
 Relationship resources:<br />
 
  Items from a merchant:<br />
   GET /api/v1/merchants/:id/items<br />
   
   <pre><code></pre></code>
   
  Merchant that belongs to an item:<br />
   GET /api/v1/items/:id/merchant<br />
   
   <pre><code></pre></code>

Find endpoints: <br />

  Returns a single resource matching attributes:<br />
    GET /api/v1/<resource>/find?<attribute>=<value><br />
  
  <pre><code></pre></code>
  
  Returns all resources matching attributes:<br />
    GET /api/v1/<resource>/find_all?<attribute>=<value><br />
  
  <pre><code></pre></code>
  
 Buiness Intelligence endpoints:<br />
 
  Merchants with the most revenue: <br />
    GET /api/v1/merchants/most_revenue?quantity=x<br />
    
    <pre><code></pre></code>
    
  Merchants with most items sold:<br />
    GET /api/v1/merchants/most_items?quantity=x<br />
    
    <pre><code></pre></code>
    
  Revenue accross date range: <br />
    GET /api/v1/revenue?start=<start_date>&end=<end_date><br />
    
    <pre><code></pre></code>
    
  Revenue for a merchant: <br />
    GET /api/v1/merchants/:id/revenue<br />
    
    <pre><code></pre></code>
  
  
  
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

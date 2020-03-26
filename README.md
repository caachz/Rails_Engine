# Rails Engine

## Background and Description
Rails engine is a basic ecommerce API that exposes endpoints for all crud functionality and advanced business logic endpoints. It is built to communicate with a prebuilt frontend called Rails Driver.

## Implementation Instructions
### To set up locally with front end Rails Driver:<br />

Clone down this repository and the front end of the application at https://github.com/caachz/rails_driver.<br />
Run `bundle install` on rails engine.<br />
Run `rails db:{create,migrate}` to setup the database on rails engine.<br />
Run `rake import` to seed the db.<br />
Run `rails s` to localhost:3000.<br />
Navigate to the cloned down Rails Driver and run `rails server -p 3001`.<br />
open `localhost:3001` in your browser.<br /><br />

### To set up locally using a tool like Postman:<br />

You can only clone down Rails Engine.<br />
Run `bundle install` on rails engine.<br />
Run `rails db:{create,migrate}` to setup the database on rails engine.<br />
Run `rake import` to seed the db.<br />
Run `rails s` to localhost:3000.<br />
Open a tool like postman and make any of the following requests.<br />

### Endpoints

Restful Resources for Merchants and Items: 
  
  &nbsp;&nbsp;Index: <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants<br />
    
  
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
    }</pre></code><br /><br />
  
  &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/items<br />
  <pre><code>{
    "data": [
        {
            "id": "1",
            "type": "item",
            "attributes": {
                "id": 1,
                "name": "Item Qui Esse",
                "description": "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
                "unit_price": 751.07,
                "merchant_id": 1
            }
        },
        {
            "id": "2",
            "type": "item",
            "attributes": {
                "id": 2,
                "name": "Item Autem Minima",
                "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
                "unit_price": 670.76,
                "merchant_id": 1
            }
        },
        {
            "id": "3",
            "type": "item",
            "attributes": {
                "id": 3,
                "name": "Item Ea Voluptatum",
                "description": "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
                "unit_price": 323.01,
                "merchant_id": 1
            }
        }
      ]
    }</pre></code><br /><br /><br />
  &nbsp;&nbsp;Show: <br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants/:id<br />
    
   <pre><code>{
    "data": {
        "id": "3",
        "type": "merchant",
        "attributes": {
            "id": 3,
            "name": "Willms and Sons"
        }
    }
}
</pre></code><br /><br /><br />

&nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/items/:id<br />

  <pre><code>{
    "data": {
        "id": "3",
        "type": "item",
        "attributes": {
            "id": 3,
            "name": "Item Ea Voluptatum",
            "description": "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
            "unit_price": 323.01,
            "merchant_id": 1
        }
    }
}</pre></code>
  
  &nbsp;&nbsp;Create: <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;POST /api/v1/merchants?name=happy dog<br />
    
   <pre><code>{
    "data": {
        "id": "101",
        "type": "merchant",
        "attributes": {
            "id": 101,
            "name": "happy dog"
        }
    }
}
    </pre></code><br /><br /><br />
    
   &nbsp;&nbsp;&nbsp;&nbsp;POST api/v1/items?name=painting&description=A great thing to spend money on&unit_price=478.30&merchant_id=1<br />
  
  <pre><code>
  {
    "data": {
        "id": "2486",
        "type": "item",
        "attributes": {
            "id": 2486,
            "name": "painting",
            "description": "A great thing to spend money on",
            "unit_price": 478.3,
            "merchant_id": 1
        }
    }
}
</pre></code><br /><br /><br />
  
  &nbsp;&nbsp;Update: <br />
    &nbsp;&nbsp;&nbsp;&nbsp;PATCH /api/v1/merchants/:id?name=wonderful world of house plants<br />
  
  <pre><code>{
    "data": {
        "id": "3",
        "type": "merchant",
        "attributes": {
            "id": 3,
            "name": "wonderful world of house plants"
        }
    }
}</pre></code><br /><br /><br />
  
  &nbsp;&nbsp;&nbsp;&nbsp;PATCH /api/v1/items/:id?name=Rubber Tree<br />
  
  <pre><code>{
    "data": {
        "id": "3",
        "type": "item",
        "attributes": {
            "id": 3,
            "name": "Rubber Tree",
            "description": "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
            "unit_price": 323.01,
            "merchant_id": 1
        }
    }
}</pre></code><br /><br /><br />
  
  &nbsp;&nbsp;Destroy: <br />
    &nbsp;&nbsp;&nbsp;&nbsp;DELETE /api/v1/merchants/:id<br />
  
  <pre><code></pre></code><br /><br /><br />
  
  &nbsp;&nbsp;&nbsp;&nbsp;DELETE /api/v1/items/:id<br />
  
  <pre><code></pre></code><br /><br /><br />
  
 ### Relationship resources:<br />
 
  &nbsp;&nbsp;Items from a merchant:<br /><br />
   &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants/:id/items<br />
   
   <pre><code>{
    "data": [
        {
            "id": "80",
            "type": "item",
            "attributes": {
                "id": 80,
                "name": "Item In Sed",
                "description": "Voluptas aliquid dolores deserunt dolor ipsa. Illum eum aspernatur et. Sit repellendus neque dolor. Qui natus omnis dicta occaecati placeat. Odio ipsam nisi cupiditate nihil exercitationem qui labore.",
                "unit_price": 548.08,
                "merchant_id": 4
            }
        },
        {
            "id": "81",
            "type": "item",
            "attributes": {
                "id": 81,
                "name": "Item Neque Aliquam",
                "description": "Laudantium non rerum rerum consequuntur. Facilis voluptatem quia ducimus. Distinctio assumenda voluptas dolores quod inventore. Delectus voluptatem in impedit voluptatem quos.",
                "unit_price": 137.74,
                "merchant_id": 4
            }
        }
      ]
     }</pre></code><br /><br /><br />
   
  &nbsp;&nbsp;Merchant that belongs to an item:<br /><br />
   &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/items/:id/merchant<br />
   
   <pre><code>{
    "data": {
        "id": "1",
        "type": "merchant",
        "attributes": {
            "id": 1,
            "name": "Schroeder-Jerde"
        }
    }
}</pre></code><br /><br /><br />

### Find endpoints: <br />

  &nbsp;&nbsp;Returns a single resource matching attributes:<br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchant/find?name=Jerde<br />
  
  <pre><code>{
    "data": {
        "id": "1",
        "type": "merchant",
        "attributes": {
            "id": 1,
            "name": "Schroeder-Jerde"
        }
    }
}</pre></code><br /><br /><br />
  
  &nbsp;&nbsp;Returns all resources matching attributes:<br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchant/find_all?name=one<br />
  
  <pre><code>{
    "data": [
        {
            "id": "2",
            "type": "merchant",
            "attributes": {
                "id": 2,
                "name": "Klein, Rempel and Jones"
            }
        },
        {
            "id": "10",
            "type": "merchant",
            "attributes": {
                "id": 10,
                "name": "Bechtelar, Jones and Stokes"
            }
        }
    ]
}</pre></code><br /><br /><br />
  
 ### Buiness Intelligence endpoints:<br />
 
  &nbsp;&nbsp;Merchants with the most revenue: <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants/most_revenue?quantity=2<br />
    
   <pre><code>
   {
    "data": [
        {
            "id": "14",
            "type": "merchant",
            "attributes": {
                "id": 14,
                "name": "Dicki-Bednar"
            }
        },
        {
            "id": "89",
            "type": "merchant",
            "attributes": {
                "id": 89,
                "name": "Kassulke, O'Hara and Quitzon"
            }
        }
    ]
}
</pre></code><br /><br /><br />
    
  &nbsp;&nbsp;Merchants with most items sold:<br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants/most_items?quantity=2<br />
    
   <pre><code>
   {
    "data": [
        {
            "id": "89",
            "type": "merchant",
            "attributes": {
                "id": 89,
                "name": "Kassulke, O'Hara and Quitzon"
            }
        },
        {
            "id": "74",
            "type": "merchant",
            "attributes": {
                "id": 74,
                "name": "Daugherty Group"
            }
        }
    ]
}
</pre></code><br /><br /><br />
    
  &nbsp;&nbsp;Revenue accross date range: <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/revenue?start=2012-03-09&end=2012-03-24<br />
    
  <pre><code>
  {
    "data": {
        "id": "null",
        "attributes": {
            "revenue": 40945238.33000028
        }
    }
}
</pre></code><br /><br /><br />
    
  &nbsp;&nbsp;Revenue for a merchant: <br /><br />
    &nbsp;&nbsp;&nbsp;&nbsp;GET /api/v1/merchants/:id/revenue<br />
    
   <pre><code>
   {
    "data": {
        "id": "null",
        "attributes": {
            "revenue": 338055.5400000002
        }
    }
}
</pre></code><br /><br /><br />
  
  
  
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

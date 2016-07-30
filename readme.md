# OAscout

OAscout allows Amazon resellers to efficiently find stock and drastically increase
profits by sifting through tens of thousands of items that would normally require
human interaction. Ruby, Rails, PostgreSQL, RSpec, API Consumption, API creation,
Caching, Heroku, AJAX, jQuery, Bootstrap.

Production: `www.oascout.com`  

[![IMAGE ALT TEXT HERE](http://i.imgur.com/k8rlfFZ.png)](https://www.youtube.com/watch?v=jlp7bXvxDNM)


## Getting Started

* Clone the project down    
* `cd` into the project directory  
* `bundle`  
* To set up the database, run `rake db:create db:migrate`
* To import the items `rake generate:database`  This may take a minute

### Prerequisities


```
You will need API keys for both the Amazon Product Advertising API as well as the Walmart API
```

### Running Locally

`rails s` to fire up the server.   
navigate to `localhost:3000`


## Running the tests

The test suite is written in RSpec.

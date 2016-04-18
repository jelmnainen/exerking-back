# Exercise marking system architectural documentation

## Backend

The backend follows a pretty standard Ruby on Rails API pattern. It uses Devise for token-based authentication. The routes can be found at config/routes.rb. These map each request into controller and action found at app/controllers/, which validate and modify the data using models found in /app/models. The responses are sent as JSON, which is formed by serializers found at app/serializers. 

#### Database
You can see current database schema in [db/schema.rb](db/schema.rb). Add or modify data by generating a migration or writing one yourself in db/migrations/

###### Adding test data
Test data is defined in db/seeds.rb, and can be loaded by executing 

    rake db:seed

## Frontend
See [frontend architectural documentation](https://github.com/jelmnainen/exerking-front/blob/master/archidoc.md) 

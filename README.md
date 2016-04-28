# exerking-back
![Build status](https://travis-ci.org/jelmnainen/exerking-back.svg?branch=master)

Excercise marking system backend

[Heroku](http://exerking.herokuapp.com/)
[Travis](https://travis-ci.org/jelmnainen/exerking-back)

## Architectural documentation
See [ARCHIDOC.md](https://github.com/jelmnainen/exerking-back/blob/master/ARCHIDOC.md)

## Testing documentation
See [TESTINGDOC.md](https://github.com/jelmnainen/exerking-back/blob/master/TESTINGDOC.md)

## Installation
You must have Ruby (at least 2.3.0 works) and rails ( at least 4.2.6 works) installed.
Then run

    bundle install
    rake db:migrate
    
## Running devserver
    rails s
    
## Running production server
Generate Devise secret key 

    bundle exec rake secret

copy the key and insert the following line into config/initializers/devise.rb, inside the "Devise.setup do |config|" block:

    config.secret_key=generatedKey

Also, set the config.mailerSender. Then you can do

    rails s -e production -p [portnumber]

where you can switch [portnumber] to the port where you wish to run the API.

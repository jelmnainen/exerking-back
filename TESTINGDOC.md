# TESTING DOCUMENTATION

Back-end has been tested with RSpec-framework. All REST endpoints are covered by request specs.

All tests are located in `/spec/` directory.

These tests are runned automatically for each commit on the continous integration server provided by Travis CI.

## Running tests

To run tests use command:

```
bundle exec rspec -fd --color spec/
```

Coverage report can be found at `/coverage/index.html`.

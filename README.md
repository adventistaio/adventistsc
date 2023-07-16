# AdventistCommunity

This is a community project for Adventist community, to create and share information and media with others.

* System dependencies
  - Ruby version 3.2.0
  - Rails 7.0.6
  - mailcatcher: Needs to be installed out from Gemfile
  - postgresql
  - Redis
  - vips `sudo apt install libvips`

* Configuration
  - Setup the `config/database.yml` file to connect with PostgreSQL. You can base it on the example file by copying the file and modifying it.
  ```bash
  $ cp config/database.yml.example config/database.yml
  ```

* Database creation
```bash
$ bin/rails db:create
```

* Database initialization
```bash
$ bin/rails db:setup
$ bin/rails db:seed
```

* How to run the test suite
```bash
$ bin/rspec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

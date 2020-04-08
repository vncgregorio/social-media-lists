# SOCIAL MEDIA LISTS V2 - Vinícius Gregório

## Installation

It is necessary to configure the accesses to the database in the database.yml file.
The application was developed using [MySQL](https://www.mysql.com/) as a database but can be changed to use [PostgreSQL](https://www.postgresql.org/) or another database with changes to Gemfile (for the adapter) and database.yml.

For use on a development machine with other Rails projects in different versions, I recommend using a ruby environment management system, such as [RVM](https://rvm.io/). If this is your case, create a new gemset with the commands below:

```
rvm gemset create rails-social-media-lists
rvm gemset use rails-social-media-lists
```

After defining the current gemset, run the bundler to install all project dependencies:

```
bundle install
```

After updating the gemset with the application's dependencies, it is necessary to initialize the database for use:

```
rake db: create db: migrate db: seed
```

## Dependencies

The application uses the dependencies below:

[rspec](https://github.com/rspec/rspec-rails) - RSpec for unit tests and for integration tests (feature).

[capybara](https://github.com/teamcapybara/capybara) - For integration tests and simulate user navigation.

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) - Gem with DSL to facilitate integration tests development.

[factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) - For automated tests stub management.

[faker](https://github.com/faker-ruby/faker) - Generate fake data for stubs in tests and to populate the development database.

[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Clean and keep the test database stable.

[seedbank](https://github.com/james2m/seedbank) - To organize the loading of the database into several tables and also to not pollute a single file (db/seeds.rb).

[annotate_models](https://github.com/ctran/annotate_models) - Generate comments and documentation on models and tests while mapping columns in the database for a resource.

[will_paginate](https://github.com/mislav/will_paginate) and [will_paginate-bootstrap4](https://github.com/delef/will_paginate-bootstrap4) - Boostrap 4 pagination for the posts listing interface .

The application also uses specific CDNs to link to visual components (bootstrap).

## About the task

The activity proposes the development of a simple application for the listing of social media records, segmented by social networks and lists of people.

Data modeling follows the principle that a person can have multiple social media accounts, even if they are from the same social network. These accounts can have posts with their own characteristics that also allow a filter by their content.

These people can be organized into lists and all posts from your social media accounts would be linked to that list.

This scenario allows some development approaches because the content is rich and fragmented in several different business entities, and can be filtered by many criteria.

To solve the task and keep external dependencies to a minimum, without sacrificing application performance, I choose to use a combination of scopes in the entities proposed for this scenario.

This solution allows a clean and easy to understand code, in addition to the reuse of code in a specific separate module (Filterable) that allows to extend this concept also to the actions inside the controller.

Scopes also facilitate the development of filters with multiple lists or social networks. The social networks were separated into a specific entity in the database, with indicative fields for runtime load of necessary connectors and base URL for obtaining the posts.

Thus, although the task indicates not to perform, it would be possible to install an [activeadmin](https://github.com/activeadmin/activeadmin) and manage all entities in the database, including manage social networks without the need for changes in code.

Still within the Rails standard (ActiveRecord), it was possible to use [dependent:: nullify](https://guides.rubyonrails.org/association_basics.html) to meet the requirement to keep all posts in the database even with exclusion of the author.

## Other choices for the same result

One possibility would be to use daemons separated from the code to index these data in pre-configured formats for the types of searches to be used. [sunspot-solr](https://sunspot.github.io/) or [elasticsearch](https://github.com/elastic/elasticsearch-ruby) would be good options for this solution architecture.

However, this type of solution requires installation of additional services on the user's machine and unnecessary extra complications for an application of this size. Reasons why this option was discarded.

Another possibility with great results would be to use a non-relational database, such as [MongoDB](https://www.mongodb.com/) with [mongoid](https://github.com/mongodb/mongoid) for its characteristic flexibility in data structure, allowing for more simplified filtering.

## Future Improvements

One of the significant improvements for this application would be the development of an [API](https://jsonapi.org/) to integrate this data in other applications, together with the development of the interface in a framework such as Angular or Node.

## Tests

To run the tests:

``
rspec
``

or

``
bundle exec rspec
``

The tests were crucial to define the relationships between the entities proposed in the exercise and also to verify the possibilities of filters.

The definitions of how to perform the tests and what should be tested in an application are the subject of several ongoing debates for literally decades in the development community, with proponents and advocates of different approaches.

For the standardization of tests I used as a reference:

[https://rspec.info/about/](https://rspec.info/about/)

[http://www.betterspecs.org/](http://www.betterspecs.org/)

[https://thoughtbot.com/blog/testing-named-scopes](https://thoughtbot.com/blog/testing-named-scopes)

[https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/](https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/)

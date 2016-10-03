Project name
-
[![Build Status](https://semaphoreci.com/api/v1/emil_shakirov/cetragram_api/branches/master/badge.svg)](https://semaphoreci.com/emil_shakirov/cetragram_api)
[![Code Climate](https://codeclimate.com/github/EmilShakirov/cetragram_api/badges/gpa.svg)](https://codeclimate.com/github/EmilShakirov/cetragram_api)

Project description.

Dependencies
-

- PostgreSQL 9.3.1
  - `brew install postgres`
- Ruby 2.1.0
  - `rbenv install 2.1.0`
- Rails 4

Quick Start
-

Clone this repo:

```
git clone git@github.com:account/repo.git
cd repo
```

Run setup script

```
bin/setup
```

Initializers
-

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions
* `shrine.rb` - Shrine config

Scripts
-

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

Documentation & Examples
-

Api documentation is available at `/docs` url.

Staging
-

http://cetragram.herokuapp.com/

Third-party services
-
You have to setup `UPLOADCARE_PUBLIC_KEY` and `UPLOADCARE_SECRET_KEY` on staging or production to use https://uploadcare.com/ for file uploading.

Workflow
-

Check out our [guides](https://github.com/fs/guides/tree/master/development/maintain-existing-project/workflow).

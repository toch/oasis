# Oasis

Oasis is a simple Data Lake written in Ruby and Hanami

[![Build Status](https://travis-ci.org/toch/oasis.svg?branch=master)](https://travis-ci.org/toch/oasis)

## Requirements

### PostgreSQL

You need a running PostgreSQL database. The user you log with needs `superuser`
right in order to install the `uuid-ossp` extension in you PostgreSQL database.
If you are on a local set up, running `ALTER <user name> WITH superuser;` is a
fine solution. In other cases, ask your database administrator or look for
a fine-tuned solution such as using prepared template.

## Usage

```Bash
bundle
hanami db prepare
hanami server
```

## Run the tests

```Bash
bundle
HANAMI_ENV=test hanami db prepare
rake
```

## License

This project is licensed under the terms of the MIT license.

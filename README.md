# Oasis 🌴

Oasis is a simple Data Lake written in Ruby and Hanami

[![Build Status](https://travis-ci.org/toch/oasis.svg?branch=master)](https://travis-ci.org/toch/oasis)
[![Coverage Status](https://coveralls.io/repos/github/toch/oasis/badge.svg?branch=master)](https://coveralls.io/github/toch/oasis?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/toch/oasis.svg)](https://gemnasium.com/github.com/toch/oasis)
[![version](https://img.shields.io/badge/version-unreleased-blue.svg)](./CHANGELOG.md)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.md)

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

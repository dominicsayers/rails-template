# rails-template

A template for a modern Rails app

## Design goals

1. Support good practice for development and devops
1. Allow users to register and verify an account
1. Templated UI

## Installation

[Install Yarn](https://yarnpkg.com/lang/en/docs/install)

### Debian / Ubuntu

1. `sudo apt-get install libpq-dev`
1. `bundle install`

### RedHat / CentOS

1. `sudo yum install postgresql-devel`
1. `bundle install`

### MacOS

1. `brew install postgresql`
1. `bundle install`

## Notes

### Credentials

The credentials file only contains `secret_key_base`. Other secrets and configuration settings are managed with environment variables.

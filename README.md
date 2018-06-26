Pay Slip Generator
======

The pay slip generator will generate a pay slip based on the following details:

* First name
* Last name
* Annual Income
* Super Annuation Rate
* Payment Period

## Prerequisites

* Ruby 2.0.0
* Bundler 1.15.4

## Installation

1. Retrieve dependancies
    ```
    bundle install
    ```
2. Build and install the gem
    ```
    gem build pay-slip-generator.gemspec
    gem install --local pay-slip-generator-0.1.0.gem
    ```

## Usage

Run the following executable with the arguments mentioned above for example

    $ generate_pay_slip David Rudd 60050 9 '01 March - 31 March'

## Tests

Run the following rake task

    $ bundle exec rake

Expected Output

    Generating pay slip
    David Rudd, 01 March - 31 March, 5004, 922, 4082, 450
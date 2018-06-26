Pay Slip Generator
======

The pay slip generator will generate a pay slip based on the following details:

* First Name
* Last Name
* Annual Income
* Super Annuation Rate
* Payment Period

## Assumptions

* Super Annuation Rate provided as an integer string with no '%' sign i.e 9, not 9% or 0.09.
* Annual Income provided with no commas to denonte thousands i.e 60500, not 60,500.
* Payment Period to be a string entered and used as verbatim. No figuring out start and end dates for months.

## Prerequisites

* Ruby 2.0.0
* Bundler 1.15.4

## Installation

1. Retrieve dependancies:
    ```
    bundle install
    ```
2. Build and install the gem:
    ```
    gem build pay-slip-generator.gemspec
    gem install --local pay-slip-generator-0.1.0.gem
    ```

## Usage

Run the following executable with the arguments mentioned above for example:

    $ generate_pay_slip David Rudd 60050 9 '01 March - 31 March'

Expected output:

    Generating pay slip
    David Rudd, 01 March - 31 March, 5004, 922, 4082, 450

## Tests

Run the following rake task:

    $ bundle exec rake

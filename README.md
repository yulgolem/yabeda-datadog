# Yabeda::[Datadog](https://www.datadoghq.com/)

Adapter for easy exporting collected custom metrics from your application to the [DataDog](https://www.datadoghq.com/).

## Installation

 1. [Install and configure official DataDog gem for Ruby](https://github.com/DataDog/dogapi-rb).

 2. Add this line to your application's Gemfile:

    ```ruby
    gem 'yabeda-datadog'
    ```

    And then execute:

        $ bundle

 3. Your DataDog api key should be in ENV['DATADOG_API_KEY'], application key should go to ENV['DATADOG_APPLICATION_KEY']


## Usage

All metrics registered in [Yabeda] will be sent to DataDog.

DataDog currently supports only counters & gauges, no histogram supported.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yabeda-datadog.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

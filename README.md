# Omniauth::Nextcloud

Nextcloud strategy for OmniAuth. Can be used to authenticate with Nextcloud and get an access token for the Nextcloud API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-nextcloud'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install omniauth-nextcloud

## Usage

### Configuration

Create a new OAuth2 token in your Nextcloud instance. You can find the option in `Settings > Administration > Security` at the bottom of the page or using the link [https://nc.example.com/index.php/settings/admin/security#oauth2](https://nc.example.com/index.php/settings/admin/security#oauth2) by substituting the hostname.

```ruby
config.omniauth :nextcloud, ENV['NEXTCLOUD_APP_ID'], ENV['NEXTCLOUD_APP_SECRET'], site_url: 'https://nc.bbz-cfp.ch'
```

### Rails

Omniauth::Nextcloud requires OmniAuth v2. If you are using Rails, you will need to include `omniauth-rails_csrf_protection`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/code-fabrik/omniauth-nextcloud. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/code-fabrik/omniauth-nextcloud/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Nextcloud project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/code-fabrik/omniauth-nextcloud/blob/master/CODE_OF_CONDUCT.md).

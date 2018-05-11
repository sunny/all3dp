# All3DP

Ruby gem to send 3D files to the All3DP API.

## Installation

Add these line to your application's Gemfile:

```rb
# Send 3D files to the All3DP API.
gem "all3dp", git: "https://github.com/sunny/all3dp"
```

And then execute:

    $ bundle

## Usage

Give URLs of STL files to the API:

```rb
configuration = All3DP::API.Configuration.create(
  model_urls: ["http://wtf.sunfox.org/cults-logo.stl"],
)
configuration.url # => "https://print.all3dp.com/configuration/f00b4r…"
```

You can then redirect your users to the given URL.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake` to run the tests and linter. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

## Release

To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/sunny/all3dp. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the All3dp project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/sunny/all3dp/blob/master/CODE_OF_CONDUCT.md).

## License

Licensed under the MIT License.

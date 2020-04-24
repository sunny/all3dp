# All3DP

Ruby gem to send 3D files to All3DP's
[Craftcloud](https://craftcloud3d.com/) 3D Printing Price Comparison
Service API.

## Installation

Add these line to your application's Gemfile:

```rb
# Send 3D files to the All3DP API.
gem "all3dp"
```

And then call:

```sh
$ bundle
```

## Usage

Give URLs of STL files to the API:

```rb
configuration = All3DP::Configuration.create(
  model_urls: ["http://wtf.sunfox.org/cults-logo.stl"],
)
```

You can then redirect your users to the given URL:

```rb
configuration.url # => "https://print.all3dp.com/configuration/f00b4r…"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake` to run the tests and linter. You can also run `bin/console` for an
interactive prompt that will allow you to experiment with the API.

## Release

To release a new version, update the version number in `version.rb`, update
the `CHANGELOG.md`, commit with a message like "v42.0.0", and then run
`bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the gem to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/sunny/all3dp.

This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the
[code of conduct](https://github.com/sunny/all3dp/blob/master/CODE_OF_CONDUCT.md).

## License

Licensed under the MIT License.

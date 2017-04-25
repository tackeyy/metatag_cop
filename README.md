# MetatagCop

MetatagCop loads csv file and checks whether meta tags is set proper value.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'metatag_cop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metatag_cop

## Usage

1. Prepare csv file like this.

```
url,                            title,                description,                h1
https://www.google.co.jp/,      exepected title here, exepected description here, exepected h1 here
https://www.google.com/doodles, exepected title here, exepected description here, exepected h1 here
```

2. Run ` $ metatag_cop file_path `

## Development

- TODO

## Contributing

- TODO

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


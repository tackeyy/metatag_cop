# MetatagCop

MetatagCop loads csv file and checks whether meta tags is set proper value.  
Any questions, issues and pull requests are welcome!

[![https://gyazo.com/ad116c7c62b7782320a8fe50ba5f8b99](https://i.gyazo.com/ad116c7c62b7782320a8fe50ba5f8b99.gif)](https://gyazo.com/ad116c7c62b7782320a8fe50ba5f8b99)

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

2. Run ` $ metatag_cop file_path ` like this.

` $ metatag_cop ~/sample.csv `

3. Check result in the console.

```
url: https://www.google.co.jp/
[title] expected: exepected title here, actual: Google
[description] expected: exepected description here, actual: 世界中のあらゆる情報を検索するためのツールを提供しています。さまざまな検索機能を活用して、お探しの情報を見つけてください。
[keywords] expected: exepected keywords here, actual:
[h1] expected: exepected h1 here, actual:
url: https://www.google.com/doodles
[title] expected: exepected title here, actual: Google Doodles
[description] expected: exepected description here, actual:
[keywords] expected: exepected keywords here, actual:
[h1] expected: exepected h1 here, actual:
```

## Development

- TODO

## Contributing

- TODO

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


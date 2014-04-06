# RateBeer

Rate Beer
    To work with Rate Beer API, you need to obtain a developer key from Rate Beer. More information: http://www.ratebeer.com/json/ratebeerapi.asp

## Installation

Add this line to your application's Gemfile:

    gem 'rate_beer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rate_beer


## Usage

Configuration

```ruby
RateBeer.configure do |config|
  config.API_KEY = "YOUR_DEVELOPER_KEY"
end
```

You can also pass api key directly to the client:

```ruby
  client = RateBeer::Client.new(api_key: "YOUR_DEVELOPER_KEY")
```

Now you can use the api like this:

```ruby
  # pass beer id as an argument
  reviews = client.beer_reviews("162170")
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rate_beer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

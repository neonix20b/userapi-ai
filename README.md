# Userapi.ai Ruby

[![Gem Version](https://badge.fury.io/rb/userapi-ai.svg)](https://badge.fury.io/rb/userapi-ai)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/neonix20b/userapi-ai/blob/main/LICENSE.txt)

Userapi.ai is an awesome tool that brings great value to products.
This gem was created to facilitate Ruby and also Rails applications to use all services of Userapi.ai:
  - Midjourney API
      - [Imagine](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Describe](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Upscale](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Upsample](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Variation](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Inpaint](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Blend](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Reroll](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Zoom](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Pan](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Info](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)
      - [Status](https://www.notion.so/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142?pvs=21)

## Installation

Add the following to your Gemfile:

```ruby
gem "userapi-ai"
```

Or install with:

```shell
gem install userapi-ai
```

and require with:

```ruby
require "userapi-ai"
```

Run `bundle install`.

That's it. You are now ready to go!

## Usage

Make sure you have a
  - Discord Account or create one at [Discord](https://discord.com)
  - A Midjourney account or sign up at [Midjourney](https://www.midjourney.com)
  - A Midjourney Paid plan to use this gem or sign up at [Midjourney Plans](https://www.midjourney.com/account/)
  - A Userapi.ai Paid plan at [Userapi.ai](https://userapi.ai/)

After signing in, you can get your Discord token by checking out any message request you send in the browser.
You can do this by opening the developer tools in your browser and going to the network tab.
Then send a message in any channel and look for the request to `messages` in the network tab.
Check out the Request Headers and look for the `authorization` header. Copy the value of the header and use it as your Discord User Tokens.

### Configuration

Once you have your Userapi.ai Token, you can configure the gem with:

Open up the initializer file `config/initializers/userapi.rb` and add your API Key as the following:

```ruby
  UserapiAi.configure do |config|
    config.access_token = ENV["USERAPI_USER_TOKEN"]
  end
```

### Imagine

Imagine is a Midjourney command that allows you to use AI to generate images.
You can use it to generate images of people, animals, objects, and anything else you can imagine.

#### Basic Usage

#### Using the /imagine command

```ruby
    client = UserapiAi::Client.new(service: :midjourney)
    result = client.imagine(prompt: "nice girl")
    or
    result = client.imagine(prompt: "nice girl",
                            webhook_url: "https://example.com/imagine/webhook-url",
                            webhook_type: "progress", # or result
                            account_hash: "a7d44910-88a6-4673-acc8-d60ffc3479a6",
                            is_disable_prefilter: false)
    then
    client.status(result)
```

#### Examples of other commands with parameters

```ruby
    client = UserapiAi::Client.new(service: :midjourney)
    result = client.status(hash: "xxx-xxx")
    result = client.variation(hash: "xxx-xxx", choice: 1)
    result = client.upsample(hash: "xxx-xxx", choice: "v6_2x_subtle")

    result = client.upscale(hash: "xxx-xxx", 
                            choice: 1,
                            webhook_url:  "https://example.com/upscale/webhook-url",
                            webhook_type: "result")
```
See more [here](https://butternut-saffron-e5e.notion.site/Midjourney-userapi-ai-doc-en-119680339b0a47e2ba6ae467eca58142#9abe719bb58948039acb5f0a6aee8947)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at [Open an Issue](https://github.com/neonix20b/userapi-ai).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
Feel free to use it and contribute.

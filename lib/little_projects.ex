defmodule LittleProjects do
  # Stuff with Pushover
  def send_message(title, content) do
    message = %Pushover.Model.Message{
      title: title,
      data: content
    }

    Pushover.Api.Messages.send(message)
  end

  def send_message(title, content, :acknowledge) do
    message = %Pushover.Model.Message{
      title: title,
      priority: 2,
      expire: 600,
      # seconds
      retry: 30,
      data: content
    }

    Pushover.Api.Messages.send(message)
  end

  ## Stuff with the mastodon API
  # https://docs.joinmastodon.org/methods/accounts/#following
  # https://hexdocs.pm/mastodon_client/readme.html
  # TODO: ALl this should be on their own module.
  def masto_conn do
    %MastodonClient.Conn{
      instance: Application.get_env(:little_projects, :instance),
      access_token: Application.get_env(:little_projects, :access_token)
    }
  end

  def masto_id do
    {:ok, info} = MastodonClient.get(masto_conn(), "/api/v1/accounts/verify_credentials")
    info.body["id"]
  end

  def get_followers do
    {:ok, info} = MastodonClient.get(masto_conn(), "/api/v1/accounts/" <> masto_id() <> "/following")
    info.body
  end

  # TODO: This is paginated and trimmed, you want all followers.
  def get_just_followers_emails do
    Enum.map(get_followers(), fn(user)-> user["acct"] end)
  end

  # TODO: Follow any account that posts about #Elixir and add them to the Elixir list.



  # Stuff you should try with httppoison
  # https://hexdocs.pm/httpoison/readme.html


  # Tesla looks like a simpler http client
  # https://hexdocs.pm/tesla/readme.html

  # Req, reocmmened by Finch as http clietn
  # https://github.com/wojtekmach/req

  # Floki, html parser that you're definitely going ot use more than once.
  # https://hexdocs.pm/floki/readme.html

  # Oban. Job Scheduler. Useful if you want to automate some of your fedi experience
  # https://hexdocs.pm/oban/Oban.html

  # Swoosh, default mailer used by Phoenix
  # https://hexdocs.pm/swoosh/Swoosh.html

  # CSV decoding and encoding
  # https://hexdocs.pm/csv/readme.html

  # Libcluster. SOmething tells me you'll end up using this soon
  # https://hexdocs.pm/libcluster/readme.html#usage

  # Useful for an API caching thing.
  # https://hexdocs.pm/decorator/readme.html

  # CacheX obviously
  # https://hexdocs.pm/cachex/getting-started.html

  # XMLbuilder for legacy sites that need it
  # https://hexdocs.pm/xml_builder/readme.html

  # Test-watch like NOdemon
  # https://hexdocs.pm/mix_test_watch/readme.html

  # Bypass, to mock http servers in tests
  # https://hexdocs.pm/bypass/Bypass.html

  # Quantum, cron-like job sscheduler. Ideal for what you were thinking with Pushover or Fediverse automation.
  # https://hex.pm/packages/quantum

  # GRPC
  # https://hexdocs.pm/grpc/readme.html

  # Hammer rate limiter, ideal if you build a page for users and want to limit what they upload or the bandwidth
  # https://hex.pm/packages/hammer

  # Temp, An Elixir module to easily create and use temporary files and directories
  # https://hexdocs.pm/temp/readme.html

  # ex_vcr to mock APIs
  # https://hex.pm/packages/exvcr

  # Stripe integration
  # https://hexdocs.pm/stripity_stripe/readme.html

  # Mimic, a mocking library
  # https://hexdocs.pm/mimic/readme.html

  # Plug is nice to experiment with but you'll quickly find Phoenix more interesting
  # https://hexdocs.pm/plug/readme.html

  # Briefly, like temp for short usage files
  # https://hexdocs.pm/briefly/usage.html

  # Erlexec, run OS commands
  # https://hexdocs.pm/erlexec/readme.html

  # Soap, for old-fashion APIs
  # https://hexdocs.pm/soap/readme.html

  # QRCode te generate qrcodes
  # https://github.com/iodevs/qr_code

  # Basic AUth plug, is deprecated but still useful for its docs
  # https://github.com/paulanthonywilson/basic_auth

  # Countriex, information about every country
  # Here an example https://github.com/navinpeiris/countriex/blob/master/lib/countriex/data.ex

  # Openai, community maintained GPT wrapper
  # https://github.com/mgallo/openai.ex

  # Blacksmith, fake data generator for tests
  # https://hex.pm/packages/blacksmith

  # Kaffy
  # Admin interface for Phoenix
  # https://github.com/aesmail/kaffy

  # OF COURSE this 👇
  # https://github.com/h4cc/awesome-elixir
end

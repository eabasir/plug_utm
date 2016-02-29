# PlugUtm
[![Build Status](https://travis-ci.org/honeypotio/plug_utm.svg)][1]

Plug that saves [UTM tracking params][4] to cookies.

## Installation

The package can be installed as:

  1. Add plug_utm to your list of dependencies in `mix.exs`:

    def deps do
      [{:plug_utm, "~> 0.0.1"}]
    end


## Setup

Phoenix example:

```elixir
# web/router.ex
  ...
  pipeline :browser do
    ...
    plug PlugUtm
  end
  ...
```

```elixir
# web/controllers/users_controller.ex
  ...
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(
      %User{}, user_params |> Map.merge(%{"source" => conn.cookies["utm.source"]})
    )
    case Repo.insert(changeset) do
    ...
  end
  ...
```

License
-------

Copyright © 2016 [Honeypot GmbH][3]. It is free software, and may be
redistributed under the terms specified in the [LICENSE](/LICENSE) file.

About Honeypot
--------------

[![Honeypot](https://www.honeypot.io/logo.png)][3]

Honeypot is a developer focused job platform.
The names and logos for Honeypot are trademarks of Honeypot GmbH.

[1]: https://travis-ci.org/honeypotio/plug_utm
[2]: http://www.whatamiworth.io?utm_source=github
[3]: https://www.honeypot.io?utm_source=github
[4]: https://en.wikipedia.org/wiki/UTM_parameters

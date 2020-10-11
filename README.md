# Ornithologist

To start:

  * `docker build .`
  * `docker-compose run --rm web mix deps.get`
  * `docker-compose run --rm web mix ecto.setup`
  * `docker-compose run --rm web bash -c 'cd assets && npm install'`
  * `docker-compose up`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To debug:

  * Put `require IEx;IEx.pry`
  * Run it against the same web container `docker exec -it CONTAINER_ID bash -c 'PORT=4001 iex -S mix phx.server'`
  * Run code where you placed pry on localhost:4001

To run tests:

  * `docker-compose run --rm web mix test`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

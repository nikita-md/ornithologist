defmodule Ornithologist.Repo do
  use Ecto.Repo,
    otp_app: :ornithologist,
    adapter: Ecto.Adapters.Postgres
end

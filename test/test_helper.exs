ExUnit.start()
Exq.Mock.start_link(mode: :redis)
Ecto.Adapters.SQL.Sandbox.mode(Ornithologist.Repo, :manual)

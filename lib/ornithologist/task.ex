defmodule Ornithologist.Task do
  use Ecto.Schema

  schema "tasks" do
    field :description, :string
    field :priority, :integer
  end
end

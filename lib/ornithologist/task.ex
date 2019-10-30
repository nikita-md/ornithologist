defmodule Ornithologist.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :description, :string
    field :priority, :integer
  
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :priority])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end

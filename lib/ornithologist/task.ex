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
    |> cast(params, required_params())
    |> validate_required(required_params())
    |> validate_inclusion(:priority, Ornithologist.Task.Priority.values)
    |> unique_constraint(:name)
  end

  defp required_params, do: [:name, :description, :priority]
end

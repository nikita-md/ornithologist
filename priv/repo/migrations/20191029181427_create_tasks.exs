defmodule Ornithologist.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :description, :string
      add :priority, :integer, default: 1

      timestamps()
    end
  end
end

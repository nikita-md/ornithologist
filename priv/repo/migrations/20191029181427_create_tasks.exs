defmodule Ornithologist.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :string
      add :priority, :integer, default: 1
    end
  end
end

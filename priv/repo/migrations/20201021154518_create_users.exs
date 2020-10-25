defmodule Ornithologist.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password_hash, :string
      add :role, :integer, default: 0

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end

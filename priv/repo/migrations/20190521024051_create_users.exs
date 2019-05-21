defmodule EctoTraining.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string, null: false
      add :password, :string, null: false
      add :active, :boolean, default: true, null: false
      add :avatar_url, :string
      add :type, :string
      add :trial_period, :integer
      timestamps()
    end
  end
end

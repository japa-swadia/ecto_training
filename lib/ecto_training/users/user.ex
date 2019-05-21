defmodule EctoTraining.Users.User do
  @moduledoc """
  User Schema
  """

  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @required_fields [:name, :username, :password, :type]
  @optional_fields [:active, :avatar_url, :trial_period, :inserted_at, :updated_at]
  @user_types ["free", "paid", "enterprise"]

  @derive {
    Poison.Encoder,
    only: [:name, :username, :type, :password, :active, :avatar_url, :trial_period]
  }

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :active, :boolean, default: true
    field :avatar_url, :string
    field :type, :string
    field :trial_period, :integer
    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:type, @user_types)
    |> validate_length(:username, min: 8, max: 20)
    |> unique_constraint(:username)
    |> validate_for_type()
  end

  defp validate_for_type(changeset) do
    type = get_field(changeset, :type)
    
    if type == "free" do
      validate_required(changeset, [:trial_period])
    else
      changeset
    end
  end

  def by_type(user, type) do
    from u in user,
      where: u.type == ^type
  end

  def active(user) do
    from u in user,
      where: u.active == true
  end
end
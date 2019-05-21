defmodule EctoTraining.Users do
  @moduledoc """
  Users context
  """

  alias EctoTraining.{Repo, Users.User}

  def get_active_users do
    User
    |> User.active()
    |> Repo.all()
  end

  def get_users_by_type(type) do
    User
    |> User.by_type(type)
    |> Repo.all()
  end
end
defmodule EctoTrainingWeb.UserController do
  @moduledoc """
  User controller
  """

  use EctoTrainingWeb, :controller
  import Ecto.Changeset
  alias EctoTraining.{Users, Users.User, Repo}

  def index(conn, _params) do
    users = Users.get_active_users()
    send_resp(conn, 200, Poison.encode!(%{users: users}))
  end

  def fetch(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    case user do
      nil ->
        send_resp(conn, 404, "User not found")
      user ->
        send_resp(conn, 200, Poison.encode!(%{user: user}))
    end
  end

  def create(conn, params) do
    sanitized_params = params |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, String.to_atom(k), v) end)
    cs = %User{} |> User.changeset(sanitized_params)
    if cs.valid? do
      user = apply_changes(cs)
      Repo.insert(cs)
      send_resp(conn, 201, "User created")
    else
      send_resp(conn, 400, "Cannot create user, reason: #{inspect cs.errors}")
    end
  end
end
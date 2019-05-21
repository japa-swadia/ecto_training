# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EctoTraining.Repo.insert!(%EctoTraining.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias EctoTraining.{Users.User, Repo}

users_params = [
  %{
    name: "John Doe",
    username: "johndoe11",
    password: "abc123xyz00",
    active: true,
    avatar_url: "abc.co/img",
    type: "free",
    trial_period: "15"
  },
  %{
    name: "Jane Doee",
    username: "jane1223",
    password: "ddd123xyz00",
    active: true,
    type: "free",
    trial_period: "15"
  },
  %{
    name: "Paul Blanco",
    username: "pb67889",
    password: "ooo123xyz00",
    active: false,
    type: "paid"
  },
  %{
    name: "Mary Pat",
    username: "maryp90909090",
    password: "cfcf123xyz00",
    active: true,
    avatar_url: "tty.co/img",
    type: "enterprise"
  }
]

Enum.each(users_params, fn user ->
  %User{} |> User.changeset(user) |> Repo.insert()
end)
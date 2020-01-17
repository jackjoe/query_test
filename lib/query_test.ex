defmodule QueryTest do
  import Ecto.Query, warn: false

  alias QueryTest.User

  @moduledoc """
  QueryTest keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def massive_run() do
    from(u in QueryTest.User) |> QueryTest.Repo.delete_all()

    0..20000
    |> Enum.into([])
    |> Enum.map(&do_query(&1))

    IO.puts("Done with massive run")
  end

  def do_query(idx) do
    firstname = "firstname_#{idx}"

    # insert
    User.changeset(%User{}, %{
      "firstname" => firstname,
      "lastname" => "lastname_#{idx}",
      "email" => "email_#{idx}@foo.com",
      "password" => "password_#{idx}",
      "password_confirmation" => "password_#{idx}"
    })
    |> QueryTest.Repo.insert()

    # get
    user =
      from(u in User, where: u.firstname == ^firstname)
      |> QueryTest.Repo.one()

    # update x 4
    User.changeset(user, %{"lastname" => "UDPATED"}) |> QueryTest.Repo.update()
    User.changeset(user, %{"email" => "UDPATED@update.com"}) |> QueryTest.Repo.update()
    User.changeset(user, %{"lastname" => "UDPATED2"}) |> QueryTest.Repo.update()
    User.changeset(user, %{"email" => "UDPATED2@update.com"}) |> QueryTest.Repo.update()

    # get
    from(u in User, where: u.firstname == ^firstname)
    |> QueryTest.Repo.one()
  end
end

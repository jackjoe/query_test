defmodule QueryTest.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias QueryTest.User

  schema "users" do
    field(:email, :string)
    field(:firstname, :string)
    field(:lastname, :string)
    field(:token, :string)
    field(:encrypted_password, :string)
    field(:reset_token, :string, default: nil)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)
    timestamps()
  end

  @doc false
  @spec changeset(User.t(), map()) :: Ecto.Changeset.t()
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :firstname, :lastname, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
  end
end

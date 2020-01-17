defmodule QueryTest.Repo do
  use Ecto.Repo,
    otp_app: :query_test,
    adapter: Ecto.Adapters.MyXQL
end

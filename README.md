# QueryTest

Test project to find the `ER_MAX_PREPARED_STMT_COUNT_REACHED` we bumped into using MyXQL.

To reproduce the issue, just run the project and then the main (and only) method inside the `QueryTest` module. Update the dev config for your repo settings.

```
mix deps.get
mix ecto.migrate
iex -S mix phx.server
QueryTest.massive_run()
```

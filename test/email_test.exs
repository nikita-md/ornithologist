defmodule OrnithologistWeb.EmailTest do
  use ExUnit.Case
  use Bamboo.Test

  alias OrnithologistWeb.Email

  setup do
    %{
      from_email: System.get_env("APP_EMAIL"),
      to_email: "to@email.com",
      subject: "All tasks are deleted",
    }
  end

  test "tasks_deleted", ctx do
    email = Email.all_tasks_deleted(ctx.to_email)
    IO.inspect(email)
    assert email.from == {nil, ctx.from_email}
    assert email.to == [{nil, ctx.to_email}]
    assert email.subject == ctx.subject
  end
end

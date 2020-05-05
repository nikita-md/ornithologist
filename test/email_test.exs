defmodule OrnithologistWeb.EmailTest do
  use ExUnit.Case
  use Bamboo.Test

  alias Ornithologist.{Email}

  setup do
    %{
      from_email: System.get_env("APP_EMAIL"),
      to_email: "to@email.com",
      subject: "All tasks are deleted",
    }
  end

  test "tasks_deleted", ctx do
    email = Email.tasks_deleted(ctx.to_email)
    assert email.from == ctx.from_email
    assert email.to == ctx.to_email
    assert email.subject == ctx.subject
  end
end

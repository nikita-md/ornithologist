defmodule Ornithologist.Email do
  use Bamboo.Phoenix, view: Ornithologist.EmailView

  @from_email System.get_env("APP_EMAIL")

  def tasks_deleted(to, from \\ @from_email) do
    new_email()
    |> to(to)
    |> from(from)
    |> subject("All tasks are deleted")
    |> text_body("Hey all your tasks are deleted successfully!")
  end
end

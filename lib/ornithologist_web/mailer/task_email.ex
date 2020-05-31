defmodule OrnithologistWeb.Email do
  use Bamboo.Phoenix, view: OrnithologistWeb.EmailView
  alias OrnithologistWeb.Mailer

  @from_email System.get_env("APP_EMAIL")

  def all_tasks_deleted(to, from \\ @from_email) do
    new_email()
    |> to(to)
    |> from(from)
    |> subject("All tasks are deleted")
    |> put_html_layout({OrnithologistWeb.LayoutView, "email.html"})
    |> render("delete_all.html", email_address: from)
    |> Mailer.deliver_now
  end
end

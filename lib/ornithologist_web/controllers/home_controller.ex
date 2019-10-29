defmodule OrnithologistWeb.HomeController do
  use OrnithologistWeb, :controller

  alias Ornithologist.{Repo, Task}

  def index(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, "index.html", tasks: tasks)
  end
end

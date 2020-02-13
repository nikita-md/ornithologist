defmodule OrnithologistWeb.TaskController do
  use OrnithologistWeb, :controller

  alias Ornithologist.{Repo, Task}

  def index(conn, _params) do
    tasks = Repo.all(Task)
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Task.changeset(%Task{}))
  end

  def create(conn, %{"task" => task}) do
    case Repo.insert(Task.changeset(%Task{}, task)) do
      {:ok, _task} -> conn
        |> put_flash(:info, "task successfully created")
        |> redirect(to: Routes.task_path(conn, :index))
      {:error, changeset} -> conn
        |> put_flash(:error, for({attr, message} <- changeset.errors, do: "#{attr} #{elem(message, 0)}"))
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get(Task, id) |> Repo.delete
    conn
    |> put_flash(:info, "task deleted")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end

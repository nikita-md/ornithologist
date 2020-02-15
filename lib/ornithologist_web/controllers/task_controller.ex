defmodule OrnithologistWeb.TaskController do
  use OrnithologistWeb, :controller

  alias Ornithologist.{Repo, Task}

  def index(conn, _params) do
    import Ecto.Query
    tasks = Repo.all(from t in Task, order_by: [desc: t.updated_at])
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

  def edit(conn, %{"id" => id}) do
    case Repo.get(Task, id) do
      nil -> conn
        |> put_flash(:error, "task doesn't exist")
        |> redirect(to: Routes.task_path(conn, :index))
      task -> conn
        |> render("edit.html", changeset: Task.changeset(task), task: task)
    end
  end

  def update(conn, %{"id" => id, "task" => task}) do
    old_task = Repo.get(Task, id)
    Task.changeset(old_task, task)
    |> Repo.update
    |> case do
      {:ok, _task} -> conn
        |> put_flash(:info, "task successfully updated")
        |> redirect(to: Routes.task_path(conn, :index))
      {:error, changeset} -> conn
        |> put_flash(:error, for({attr, message} <- changeset.errors, do: "#{attr} #{elem(message, 0)}"))
        |> render("edit.html", changeset: changeset, task: old_task)
    end
  end
end

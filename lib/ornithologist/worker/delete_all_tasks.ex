defmodule Ornithologist.Worker.DeleteAllTasks do
  alias Ornithologist.{Repo, Task}
  alias OrnithologistWeb.Email

  require Logger

  def perform do
    Logger.info("Running in backgroung")
    Repo.delete_all(Task)
    Email.all_tasks_deleted("nikitanaryshev@gmail.com")
  end
end

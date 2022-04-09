defmodule ChatWeb.ThreadController do
  use ChatWeb, :controller
  alias Chat.Title

  def index(conn, _params) do
    threads = Title.list_threads()
    render(conn, "index.html", threads: threads)
  end

  # def new(conn, _params) do
  #   thread = Title.build_thread
  #   changeset = Title.change_thread(thread)
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{ "thread" => thread_params }) do
  #   Title.create_thread(thread_params)
  #   redirect(conn, to: Routes.thread_path(conn, :index))
  # end
end

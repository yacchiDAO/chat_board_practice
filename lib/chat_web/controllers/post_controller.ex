defmodule ChatWeb.PostController do
  use ChatWeb, :controller
  alias Chat.Board
  alias Chat.Title

  def index(conn, %{ "thread_id" => thread_id }) do
    thread = Title.get_thread(thread_id)
    posts = Board.list_posts(thread_id)
    render(conn, "index.html", posts: posts, thread: thread)
  end
end

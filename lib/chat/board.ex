defmodule Chat.Board do
  import Ecto.Query, warn: false
  alias Chat.Repo
  alias Chat.Board.Post

  def list_posts(thread_id) do
    Post
    |> where([p], p.thread_id == ^thread_id)
    |> order_by([p], [asc: p.number])
    |> Repo.all
  end

  def get_next_post_number(thread_id) do
    Post
    |> select([p], p.number)
    |> where([p], p.thread_id == ^thread_id)
    |> order_by([p], [desc: p.number])
    |> limit([p], 1)
    |> Repo.one
    |> Kernel.||(0)
    |> Kernel.+(1)
  end

  def create_post!(%{thread_id: thread_id, body: body, name: ""}), do: create_post!(%{thread_id: thread_id, body: body, name: "名無しさん"})

  def create_post!(%{thread_id: thread_id, body: body, name: name}) do
    %Post{}
    |> Post.changeset(Map.put(%{ thread_id: thread_id, body: body, name: name }, :number, get_next_post_number(thread_id)))
    |> Repo.insert!()
  end
end

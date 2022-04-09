defmodule ChatWeb.RoomChannel do
  use Phoenix.Channel
  alias Chat.Board
  alias Timex.Format.DateTime.Formatters.Strftime

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, socket) do
    {:ok, socket}
  end

  # TODO: uidとかを渡してスレごとに表示 joinをいい感じにする必要があるかも
  def handle_in("new_msg", %{"thread_id" => _, "body" => "", "name" => _}, socket), do: { :noreply, socket }

  def handle_in("new_msg", %{"thread_id" => thread_id, "body" => body, "name" => name}, socket) do
    # TODO: トランザクション
    post = Board.create_post!(%{ thread_id: thread_id, body: body, name: name })
    # TODO: マップもりもりなのが気持ち悪い
    attrs = %{body: post.body, name: post.name, number: post.number, inserted_at: format_datetime(post.inserted_at)}
    broadcast!(socket, "new_msg", attrs)

    { :noreply, socket }
  end

  # 日付のフォーマット
  # TODO: postのViewModelと共通化
  defp format_datetime(time) do
    Strftime.format!(time, "%Y年%-m月%-d日 %H:%M:%S")
  end
end

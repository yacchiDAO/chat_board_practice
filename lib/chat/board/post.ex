defmodule Chat.Board.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :thread_id, :integer
    field :name, :string
    field :body, :string
    field :number, :integer

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:thread_id, :name, :body, :number])
  end
end

defmodule Chat.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :thread_id, references(:threads)
      add :number, :integer, null: false
      add :name, :string
      add :body, :text, null: false

      timestamps()
    end

    create index("posts", [:thread_id])
  end
end

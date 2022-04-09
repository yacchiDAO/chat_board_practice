defmodule Chat.TitleTest do
  use Chat.DataCase

  alias Chat.Title

  describe "thread" do
    alias Chat.Title.Thread

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def thread_fixture(attrs \\ %{}) do
      {:ok, thread} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Title.create_thread()

      thread
    end

    test "list_thread/0 returns all thread" do
      thread = thread_fixture()
      assert Title.list_thread() == [thread]
    end

    test "get_thread!/1 returns the thread with given id" do
      thread = thread_fixture()
      assert Title.get_thread!(thread.id) == thread
    end

    test "create_thread/1 with valid data creates a thread" do
      assert {:ok, %Thread{} = thread} = Title.create_thread(@valid_attrs)
    end

    test "create_thread/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Title.create_thread(@invalid_attrs)
    end

    test "update_thread/2 with valid data updates the thread" do
      thread = thread_fixture()
      assert {:ok, %Thread{} = thread} = Title.update_thread(thread, @update_attrs)
    end

    test "update_thread/2 with invalid data returns error changeset" do
      thread = thread_fixture()
      assert {:error, %Ecto.Changeset{}} = Title.update_thread(thread, @invalid_attrs)
      assert thread == Title.get_thread!(thread.id)
    end

    test "delete_thread/1 deletes the thread" do
      thread = thread_fixture()
      assert {:ok, %Thread{}} = Title.delete_thread(thread)
      assert_raise Ecto.NoResultsError, fn -> Title.get_thread!(thread.id) end
    end

    test "change_thread/1 returns a thread changeset" do
      thread = thread_fixture()
      assert %Ecto.Changeset{} = Title.change_thread(thread)
    end
  end
end

defmodule ChatWeb.PostView do
  use ChatWeb, :view
  alias Timex.Format.DateTime.Formatters.Strftime

  def format_datetime(time) do
    Strftime.format!(time, "%Y年%-m月%-d日 %H:%M:%S")
  end
end

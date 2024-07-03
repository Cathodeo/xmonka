defmodule XmonkaWeb.PageController do
  use XmonkaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

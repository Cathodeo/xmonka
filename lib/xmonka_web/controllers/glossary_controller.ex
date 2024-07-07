defmodule XmonkaWeb.GlossaryController do

  use XmonkaWeb, :controller

  def index(conn, _params) do
    monsters = Xmonka.Monster.monster_index()
    render(conn, "index.html", monsters: monsters)
  end

  def show(conn, %{"id" => id}) do
    monster = Xmonka.Monster.get_monster(id)
    move = Xmonka.Monster.move_by_monster(id)
    render(conn, "show.html", monster: monster, move: move)
  end

end

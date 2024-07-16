defmodule XmonkaWeb.PlayerLive do
  use XmonkaWeb, :live_view
  alias Xmonka.Repo

  def monsters_in_hand(player) do
  state = Xmonka.Player.get_state(player)
  monsters = Xmonka.Player.filter_monster_content_by_location(state, :hand)
  list_monsters = monsters |> Enum.map(fn {_key, %Xmonka.Player.Monster{species: species}} -> species end)
  Enum.map(list_monsters, fn item -> Repo.get(Xmonka.Monster, item) end)
  end

  def mount(_params, _session, socket) do
    {:ok,
    assign(

    socket,
    player1_deck: Xmonka.Player.get_state(:player_1),
    player1_monsters: monsters_in_hand(:player_1),
    player1_name: "Player 1",
    player2_deck: Xmonka.Player.get_state(:player_2),
    player2_monsters: monsters_in_hand(:player_2),
    player2_name: "Player 2"
    )
    }
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <h1>Player Registration</h1>

    <h6>Find here the fields to register a player</h6>
    <h6>This page is only available for debugging purposes</h6>

    <h3>Player 1 name is: <%= @player1_name %> </h3>
    <h3>Player 2 name is: <%= @player2_name %> </h3>
    <br><br><br>

    <article>
    <h3> <%= @player1_name %> has the following monsters in his hand: </h3>
    <h6><%= for monster <- @player1_monsters do %>
    <%= monster.name %> <img style="height: 45px; width: 45px"src="/images/monster<%=monster.id%>.png"> <br>
    <% end %>
    </h6>
    </article>

    <aside>
    <h3> <%= @player2_name %> has the following monsters in his hand: </h3>
    <h6><%= for monster <- @player2_monsters do %>
    <%= monster.name %> <img style="height: 45px; width: 45px"src="/images/monster<%=monster.id%>.png"> <br>
    <% end %>
    </h6>
    </aside>
    """
  end

end

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
    player1_drawn?: nil,
    player1_selection: nil,
    player1_selection_name: nil,
    player1_selection_overview: nil,
    player1_selection_lock?: nil,
    player2_deck: Xmonka.Player.get_state(:player_2),
    player2_monsters: monsters_in_hand(:player_2),
    player2_name: "Player 2",
    player2_drawn?: nil,
    player2_selection: nil,
    player2_selection_name: nil,
    player2_selection_overview: nil,
    player2_selection_lock?: nil,
    tobattle!: "disabled"
    )
    }
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~L"""
    <h1>Player Registration</h1>

    <h6>Find here the fields to register a player</h6>
    <h6>This page is only available for debugging purposes</h6>

    <button type="button" <%= @tobattle! %> >Go to battle: This option is available after drawing cards and sending your selection of Monster</button>

    <div class="flex-container" style="display: flex;">

    <div style="padding: 30px">

    <h3 style="color: red"><b>Player 1 name is:</b> &ensp; <%= @player1_name %></h3>
    <h6>If the list of <b>Monsters</b> is empty, your hand is likely to be empty</h6>
    <a href="#" phx-click="draw1"><button type="button <%= @player1_drawn? %>">Draw 5 cards</button></a>

    </div>


    <div style="padding: 30px">

    <h3 style="color: red"><b>Player 2 name is:</b> &ensp;  <%= @player2_name %> </h3>
    <h6>If the list of <b>Monsters</b> is empty, your hand is likely to be empty</h6>
    <a href="#" phx-click="draw2"><button type="button <%= @player2_drawn? %>">Draw 5 cards</button></a></div>
    <br><br><br>


    </div>

    <div class="flex-container" style="display: flex;">

    <div style="flex: 1; padding: 50px">
    <h3> <%= @player1_name %> has the following monsters in his hand: </h3>
    <h4> Click on the Monster that will be put in the game area and press the button to send it </h4>
    <a href="#" phx-click="send_selection1"><button type="button" <%= @player1_selection_lock? %> >Send selection!</button></a>
    <h5> Current selection:</h5>
    <h3><b><%= @player1_selection_name %><b></h3>
    <div style="width: 290px; overflow: hidden">
    <iframe src="<%=@player1_selection_overview %>" height="500" width="300"></iframe>
    </div>
    <h6><%= for monster <- @player1_monsters do %>
    <%= monster.name %> <a href="#" phx-click="select1" phx-value-number=<%=monster.id%> >
    <img  style="height: 45px; width: 45px; display: block; margin-left: auto; margin-right: auto;"src="/images/monster<%=monster.id%>.png"> </a> <br>
    <% end %>
    </h6>
    </div>

    <div style="flex: 2; padding: 50px">
    <h3> <%= @player2_name %> has the following monsters in his hand: </h3>
    <h4> Click on the Monster that will be put in the game area and press the button to send it </h4>
    <a href="#" phx-click="send_selection1"><button type="button <%= @player2_selection_lock? %>">Send selection!</button></a>
    <h5> Current selection:</h5>
    <h3><b><%= @player2_selection_name %><b></h3>
    <div style="width: 290px; overflow: hidden">
    <iframe src="<%=@player2_selection_overview %>" height="500" width="300"></iframe>
    </div>
    <h6><%= for monster <- @player2_monsters do %>
    <%= monster.name %> <a href="#" phx-click="select2" phx-value-number=<%=monster.id%> >
    <img  style="height: 45px; width: 45px; display: block; margin-left: auto; margin-right: auto;"src="/images/monster<%=monster.id%>.png"> </a> <br>
    <% end %>
    </h6>
    </div>

    </div>
    """
  end



  def handle_event("select1", %{"number" => selection}=data, socket) do
    IO.inspect data
    {:noreply,
    assign(socket,
          player1_selection: selection,
          player1_selection_name: Xmonka.Monster.name_by_monster(selection),
          player1_selection_overview: "/monsters#{selection}" )}
    end


  def handle_event("select2", %{"number" => selection}=data, socket) do
    IO.inspect data
    {:noreply,
    assign(socket,
          player2_selection: selection,
          player2_selection_name: Xmonka.Monster.name_by_monster(selection),
          player2_selection_overview: "/monsters#{selection}" )}
    end

  def handle_event("draw1", _data, socket) do
    Xmonka.Player.draw_cards(:player_1, 5)
    {:noreply,
    assign(socket,
          player1_drawn?: "disabled",
          player1_monsters: monsters_in_hand(:player_1))}
  end

  def handle_event("draw2", _data, socket) do
    Xmonka.Player.draw_cards(:player_2, 5)
    {:noreply,
    assign(socket,
          player2_drawn?: "disabled",
          player2_monsters: monsters_in_hand(:player_2))}
  end

  def handle_event("send_selection1", _data, socket) do
    selected = socket.assigns.player1_selection
    Xmonka.Player.update_card_status_by_species(:player_1, selected)
    {:noreply,
    assign(socket,
          player1_selection_lock?: "disabled")}
    end

  def handle_event("send_selection2", _data, socket) do
    selected = socket.assigns.player2_selection
    locked? = socket.assigns.player1_selection_lock?
    Xmonka.Player.update_card_status_by_species(:player_2, selected)
    {:noreply,
    assign(socket,
          player2_selection_lock?: "disabled")}
    cond do
      locked? == "disabled" -> {:noreply,
    assign(socket,
    tobattle!: "enabled")}
    end

  end


end

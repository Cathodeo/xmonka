defmodule Xmonka.Player do
  use GenServer
  alias Xmonka.Player.Card

  @decksize 20

  @spec populate_deck(map(), number()) :: no_return()
  def populate_deck(map, amount_cards) when amount_cards > 0 do
    random_no = :rand.uniform(14)

    updated_map =
      Map.put(map, amount_cards, %Card{
        card_type: random_no,
        card_location: :deck,
        ismonster: ismonster?(random_no),
        monster_content: card_monsterinit(random_no)
      })

    populate_deck(updated_map, amount_cards - 1)
  end

  def populate_deck(map, 0) do
    map
  end

  def eval_card(map, cardid) do
    submap = Map.get(map, cardid)
    Map.get(submap, :card_type)
  end

  def ismonster?(cardtype) do
    category_raw = Xmonka.Repo.get_by(Xmonka.Type, id: cardtype)
    category = Map.get(category_raw, :cardtype)

    case {category} do
      {1} -> :yes
      {2} -> :not
      {3} -> :not
    end
  end

  def card_monsterinit(cardtype) do
    case {ismonster?(cardtype)} do
      {:not} -> %{}
      {:yes} -> monster_init(cardtype)
    end
  end

  def monster_init(cardtype) do
    species = Xmonka.Monster.get_species(cardtype)

    %Xmonka.Player.Monster{
      position: 0,
      current_hp: Xmonka.Monster.max_healthpoints(species),
      species: species,
      equipable: 0,
      status: 0
    }
  end

  def filter_cards_by_location(cards, location) do
    cards
    |> Enum.filter(fn {_key, card} -> card.card_location == location end)
    |> Enum.into(%{})
    end

    def filter_monster_content_by_location(cards, location) do
      cards
      |> Enum.filter(fn {_key, %Card{card_location: ^location, ismonster: :yes}} -> true
                       {_key, _card} -> false
                     end)
      |> Enum.map(fn {key, %Card{monster_content: monster}} -> {key, monster} end)
      |> Enum.into(%{})
    end
  @impl true
  def init(_nil) do
    {:ok, populate_deck(%{}, @decksize)}
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, 0, name: {:global, name})
  end

  def get_state(name) do
    GenServer.call({:global, name}, :get_state)
  end

  def set_state(name, new_state) do
    GenServer.cast({:global, name}, {:set_state, new_state})
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:set_state, new_state}, _state) do
    {:noreply, new_state}
  end

    def draw_cards(player, manycards) do
        state = get_state(player)

        {new_state, _drawn_cards} =
          Enum.reduce_while(state, {state, 0}, fn
            {key, %Card{card_location: :deck} = card}, {acc_state, drawn} when drawn < manycards ->
              new_card = %{card | card_location: :hand}
              new_state = Map.put(acc_state, key, new_card)
              {:cont, {new_state, drawn + 1}}
            {_key, _card}, acc ->
              {:cont, acc}
          end)
        set_state(player, new_state)
      end



end

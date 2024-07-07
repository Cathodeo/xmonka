defmodule Xmonka.Player do

  alias Xmonka.Player.Card
  alias Xmonka.Player.MonsterCard
  alias Xmonka.Player.AllCards



  @spec populate_deck(map(), number()) :: no_return()
  def populate_deck(map, amount_cards) when amount_cards > 0 do
    updated_map = Map.put(map, amount_cards, %Card{card_type: :rand.uniform(14), card_location: :deck})
    populate_deck(updated_map, amount_cards - 1)
    end

  def populate_deck(map, 0)
  do
    map
  end

  def draw_card(map) do
    submap = Map.get(map, Enum.max(Map.keys(map)))
    submap = Map.put(submap, :card_location, :hand)
    Map.put(map, Enum.max(Map.keys(map)), submap)
  end


  def eval_card(map, cardid) do
    submap = Map.get(map, cardid)
    Map.get(submap, :card_type)
  end

  def ismonster?(cardtype)
  do
    category_raw = Xmonka.Repo.get_by(Xmonka.Type, id: cardtype)
    category = Map.get(category_raw, :cardtype)
    case {category} do
      {1} -> :ok
      {2} -> :not_ok
      {3} -> :not_ok
    end
  end

  def newmonster(map, cardid)
  do
    safeguard = eval_card(map, cardid) |> ismonster?
    case {safeguard} do
      {:ok} ->
      deck_to_monster(map, cardid)
      {:not_ok} -> IO.puts("This is not a monster card!")
    end
  end


      def deck_to_monster(map, cardtype)
      do
        lastplusone = Enum.max(Map.keys(map)) + 1
        Map.put(map, lastplusone,
        %MonsterCard{
        current_hp: Xmonka.Player.MonsterCard.get_species(cardtype) |> Xmonka.Player.MonsterCard.get_healthpoints ,
        species: Xmonka.Player.MonsterCard.get_species(cardtype),
          equipable: 0,
          status:  0,
            benched: 0})
      end

     def get_state(agent)
     do
      Agent.get(agent, fn list -> list end)
     end

      def get_playerdeck(process_pid)
      do
        Map.get(process_pid, :non_monster)
      end

      def get_playermonster(state)
      do
        Map.get(state, :monster)
      end

      def initialize_player(playername)
      do
      deckmap = populate_deck(%{}, 60)
      monstermap = %{}
      Agent.start_link(fn -> %AllCards{player_name: playername, non_monster: deckmap, monster: monstermap} end)
      end







end

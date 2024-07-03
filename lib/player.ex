defmodule Xmonka.Player do

  alias Xmonka.Player.Card
  alias Xmonka.Player.MonsterCard

  @spec populate(map(), number()) :: no_return()
  def populate(map, amount_cards) when amount_cards > 0 do
    updated_map = Map.put(map, amount_cards, %Card{card_type: :rand.uniform(14), card_location: :deck})
    populate(updated_map, amount_cards - 1)
    end

  def populate(map, 0)
  do
    map
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
    cardtype = eval_card(map, cardid)
    safeguard = eval_card(map, cardid) |> ismonster?
    case {safeguard} do
      {:ok} -> Map.put(map, "A",
      %MonsterCard{
      current_hp: Xmonka.Player.MonsterCard.get_species(cardtype) |> Xmonka.Player.MonsterCard.get_healthpoints ,
       species: Xmonka.Player.MonsterCard.get_species(cardtype),
        equipable: 0,
         status:  0,
          benched: 0})
      {:not_ok} -> IO.puts("This is not a monster card!")
    end
  end

end

defmodule Xmonka.Deck 
do
   use Agent
   @card_ids Enum.to_list(1..14)

# Start the Agent with a randomly generated deck, using a unique name for each player
def start_link(player_id) do
    Agent.start_link(fn -> generate_deck() end, name: via_tuple(player_id))
  end

  # Generate a deck of 60 cards
  defp generate_deck do
    1..60
    |> Enum.map(fn id -> %{id: id, card_id: Enum.random(@card_ids)} end)
  end

  # Retrieve the deck for a specific player
  def get_deck(player_id) do
    Agent.get(via_tuple(player_id), fn deck -> deck end)
  end

  # Shuffle the deck for a specific player
  def shuffle(player_id) do
    Agent.update(via_tuple(player_id), &Enum.shuffle/1)
  end

  # Draw a card from the deck for a specific player
  def draw(player_id) do
    Agent.get_and_update(via_tuple(player_id), fn [top_card | rest] -> {top_card, rest} end)
  end

  # Helper function to create a unique tuple for each player
  defp via_tuple(player_id) do
    {:via, Registry, {DeckRegistry, player_id}}
  end
end


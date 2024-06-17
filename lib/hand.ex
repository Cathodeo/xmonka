defmodule Xmonka.Hand do

    def start_link() do
      Agent.start_link(fn -> [] end)
    end

    def populate_initial(hand, cardlist) when is_list cardlist do
      Agent.update(hand, fn state -> [cardlist | state] end)
    end

    def put_hand(hand, cardid)
    do
      handmany = Agent.get(hand, fn state -> state end ) |> length()
      case handmany <= 7
      do
      true -> Agent.update(hand, fn state -> [cardid | state] end)
      false -> IO.puts("Hand already full!")
      end
    end

  end

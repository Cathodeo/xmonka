defmodule Xmonka.GameArea do

  defstruct MonID_side1: 0,
            MonID_side2: 0,
            turnside1: true


  def start_link do
    Agent.start_link(fn -> %Xmonka.GameArea{} end)
    end

  def put_monster(gamearea, monid)
  do
    side = Agent.get(gamearea, fn state -> state.turnside1 end)
    case side do
      true -> Agent.update(gamearea,
      fn state -> Map.put(state, :MONID_side1, monid) end)
      false -> Agent.update(gamearea,
      fn state -> Map.put(state, :MONID_side2, monid) end)
    end
  end

  def switch_turn(gamearea)
  do
    current_turn = Agent.get(gamearea, fn state -> state.turnside1 end)
    case current_turn
    do
      true ->  Agent.update(gamearea,
      fn state -> Map.put(state, :turnside1, false) end)
      false ->  Agent.update(gamearea,
      fn state -> Map.put(state, :turnside1, true) end)
    end
  end

end

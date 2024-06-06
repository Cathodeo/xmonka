defmodule Xmonka.Monster do
  defstruct hand: false,
  cardid: 0,
   bench: false,
    ingame: false,
     alive: true,
      species: "Flavia",
        hitpoints_now: 6,
          equip: false,
            equip_id: 0,
            status: :none

  def start_link() do
    Agent.start_link(fn -> %Xmonka.Monster{} end)
  end

  def inhand?(monster) do
    Agent.get(monster, fn state -> state.hand end)
    end

    def benched?(monster) do
      Agent.get(monster, fn state -> state.bench end)
      end

      def battling?(monster) do
        Agent.get(monster, fn state -> state.ingame end)
        end

        def health?(monster) do
          Agent.get(monster, fn state -> state.hitpoints_now end)
          end

        def isequip?(monster) do
          Agent.get(monster, fn state -> state.equip end)
          end

          def do_equip(monster, itemid) do
                case isequip?(monster) do
                  true -> IO.puts("Item already equiped!")
                  false -> Agent.update(monster,
                  fn state -> Map.put(state, :equip_id, itemid)
                              Map.put(state, :equip, true)
                  end)
              end
            end

           def do_damage(monster, damage) do
              current_hp = health?(monster)
              Agent.update(monster,
              fn state -> Map.put(state, :hitpoints_now, (current_hp - damage)) end)
              case health?(monster) < 1 do
                true -> Agent.update(monster,
                fn state -> Map.put(state, :alive, false) end)
                IO.puts("Monster defeated!")
                false -> IO.puts("Damage done!")
                end
           end

  alias Xmonka.Monster
end

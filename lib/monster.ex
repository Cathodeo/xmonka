defmodule Xmonka.Monster do
 
  defstruct [:deck_cardid,
  :hand,
   :bench,
    :ingame,
     :alive,
      :hitpoints_now,
       :equip,
        :equip_id,
         :status]


 
  #Initializes monster whenever a card has been pulled from the hand or the bench 
  #Starts an agent that contains the monster state and populates the monster specific values with the values that match the card ID        
  def init_monster(deck_cardid) do
    Agent.start_link(fn -> %Xmonka.Monster{} end)
  end




  #Functions that retrieve state information that might be used by other state altering functions

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

          #Functions that alter state used by game logic

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


end

use Amnesia

defmodule(Xmonka.Database)
do
  defdatabase Database do
    deftable(
      Cards,
      [{:cardid, autoincrement}, :type, :description],
      type: :ordered_set,
      index: [:cardid])

      deftable(
      Monsters,
      [{:monid, autoincrement},:cardid, :elementid, :name, :moveid, :healthpoints],
      type: :ordered_set,
      index: [:monid])

      deftable(Equipables,
      [{:itemid, autoincrement}, :name, :cardid , :elementid, :moveid, :description],
      type: :ordered_set,
      index: [:itemid])

      deftable(Moves,
      [{:moveid, autoincrement}, :name, :element, :power, :recoil, :cointoss],
      type: :ordered_set,
      index: [:moveid])

  end
end

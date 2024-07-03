defmodule Xmonka.Player.MonsterCard
do
  defstruct current_hp: 6, species: 1, equipable: 0, status: 0, benched: 0

  def get_species(cardtype)
  do
    types_table = Xmonka.Repo.get_by(Xmonka.Type, id: cardtype)
    foreign_id = Map.get(types_table, :foreign_id)
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: foreign_id)
    Map.get(monster_table, :id)
  end

  def get_healthpoints(species)
  do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: species)
    Map.get(monster_table, :healthpoints)
  end

  def get_movename(species)
  do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: species)
    move_id = Map.get(monster_table, :move_id)
    move_table = Xmonka.Repo.get_by(Xmonka.Move, id: move_id)
    Map.get(move_table, :name)
  end


end

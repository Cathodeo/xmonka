defmodule Xmonka.Monster
do
  use Ecto.Schema
  alias Xmonka.Repo
  alias Xmonka.Monster

  schema "monsters" do
    field :name, :string
    field :healthpoints, :integer
    field :element_id, :integer
    field :move_id, :integer
  end

  def monster_index()
  do
    Repo.all(Monster)
  end

  def get_monster(id) do
    Repo.get(Monster, id)
  end

  def get_monster_by(params) do
    Repo.get_by(Monster, params)
  end

  def name_by_monster(id) do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: id)
    Map.get(monster_table, :name)
  end

  def move_by_monster(id) do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: id)
    move_id = Map.get(monster_table, :move_id)
    Xmonka.Repo.get_by(Xmonka.Move, id: move_id)

  end

  def max_healthpoints(id) do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: id)
    Map.get(monster_table, :healthpoints)
  end

  def element_name_by_monster(id) do
    element_table = Xmonka.Repo.get_by(Xmonka.Element, id: id)
    Map.get(element_table, :name)
  end

  def element_id_by_monster(id) do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: id)
    element_id = Map.get(monster_table, :element)
    element_table = Xmonka.Repo.get_by(Xmonka.Element, id: element_id)
    Map.get(element_table, :id)
  end

  def element_name_by_element(id) do
    element_table = Xmonka.Repo.get_by(Xmonka.Element, id: id)
    Map.get(element_table, :name)
  end

  def get_species(cardtype)
  do
    types_table = Xmonka.Repo.get_by(Xmonka.Type, id: cardtype)
    foreign_id = Map.get(types_table, :foreign_id)
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: foreign_id)
    Map.get(monster_table, :id)
  end

  def get_movename(species)
  do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: species)
    move_id = Map.get(monster_table, :move_id)
    move_table = Xmonka.Repo.get_by(Xmonka.Move, id: move_id)
    Map.get(move_table, :name)
  end

end

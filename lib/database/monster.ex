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

  def move_by_monster(id) do
    monster_table = Xmonka.Repo.get_by(Xmonka.Monster, id: id)
    move_id = Map.get(monster_table, :move_id)
    Xmonka.Repo.get_by(Xmonka.Move, id: move_id)
  end


end

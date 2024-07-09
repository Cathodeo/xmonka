defmodule Xmonka.Move
do
  use Ecto.Schema

  schema "moves" do
    field :name, :string
    field :power, :integer
    field :element_id, :integer
    field :description, :string
  end

  def name_by_move(id) do
    move_table = Xmonka.Repo.get_by(Xmonka.Move, id: id)
    Map.get(move_table, :name)
  end

  def power_by_move(id) do
    move_table = Xmonka.Repo.get_by(Xmonka.Move, id: id)
    Map.get(move_table, :power)
  end

  def element_id_by_move(id) do
    move_table = Xmonka.Repo.get_by(Xmonka.Move, id: id)
    Map.get(move_table, :element)
  end

  def element_name_by_element(id) do
    element_table = Xmonka.Repo.get_by(Xmonka.Element, id: id)
    Map.get(element_table, :name)
  end





end

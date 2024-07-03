defmodule Xmonka.Monster
do
  use Ecto.Schema

  schema "monsters" do
    field :name, :string
    field :healthpoints, :integer
    field :element_id, :integer
    field :move_id, :integer
  end
end

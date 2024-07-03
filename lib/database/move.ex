defmodule Xmonka.Move
do
  use Ecto.Schema

  schema "moves" do
    field :name, :string
    field :power, :integer
    field :element_id, :integer
  end
end

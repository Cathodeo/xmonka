defmodule Xmonka.Type
do
  use Ecto.Schema

  schema "cards" do
    field :cardtype, :integer
    field :foreign_id, :integer
  end
end

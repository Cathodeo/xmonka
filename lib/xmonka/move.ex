defmodule Xmonka.Move do 
    use Ecto.Schema

    schema "moves"  do
        field :move_id, :integer  
        field :name, :string
        field :power, :integer
        field :element_id, :integer
        field :description, :string
    end
end

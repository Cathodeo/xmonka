defmodule Xmonka.DBMonster do 
    use Ecto.Schema

    schema "monsters"  do
        field :monster_id, :integer  
        field :name, :string
        field :healthpoints, :integer
        field :element_id, :integer
        field :move_id, :integer
    end
end

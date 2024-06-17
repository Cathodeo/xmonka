defmodule Xmonka.Consumable do 
    use Ecto.Schema

    schema "consumableitems"  do
        field :item_id, :integer  
        field :name, :string
        field :description, :string
    end
end
 
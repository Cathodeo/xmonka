defmodule Xmonka.Card do 
    use Ecto.Schema

    schema "cards"  do
        field :card_id, :integer  
        field :card_type, :integer
        field :foreign_id, :integer
    end
end


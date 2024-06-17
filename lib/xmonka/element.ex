defmodule Xmonka.Element do 
    use Ecto.Schema

    schema "elements"  do
        field :element_id, :integer  
        field :name, :string
    end
end

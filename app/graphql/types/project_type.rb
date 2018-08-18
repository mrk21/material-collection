class Types::ProjectType < Types::BaseObject
    field :id, String, null: false
    field :ownerId, String, null: false
    field :title, String, null: false
    field :description, String, null: false
end

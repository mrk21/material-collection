# frozen_string_literal: true

class Types::AssetType < Types::BaseObject
  field :id, String, null: false
  field :authorId, String, null: false
  field :title, String, null: false
  field :description, String, null: false
end

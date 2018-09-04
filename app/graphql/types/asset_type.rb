# frozen_string_literal: true

class Types::AssetType < Types::BaseObject
  field :id, Types::IDStringType, null: false
  field :authorId, Types::IDStringType, null: false
  field :title, String, null: false
  field :description, String, null: false
end

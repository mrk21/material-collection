# frozen_string_literal: true

class Types::ProjectType < Types::BaseObject
  field :id, Types::IDStringType, null: false
  field :ownerId, Types::IDStringType, null: false
  field :title, String, null: false
  field :description, String, null: false
end

# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  field :id, String, null: false
  field :name, String, null: false
end

# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  field :id, Types::IDStringType, null: false
  field :name, String, null: false
end

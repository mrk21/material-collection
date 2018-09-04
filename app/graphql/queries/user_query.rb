# frozen_string_literal: true

class Queries::UserQuery < Queries::BaseQuery
  description 'A user'
  argument :id, Types::IDStringType, required: true
  type Types::UserType, null: false

  def resolve(id:)
    authenticate!
    Loaders::RecordLoader.for(User).load(id).then do |user|
      authorize user, :show?
      user
    end
  end
end

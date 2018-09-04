# frozen_string_literal: true

class Queries::LoggedInUserQuery < Queries::BaseQuery
  description 'A logged in user'
  type Types::UserType, null: false

  def resolve
    authenticate!
    current_user
  end
end

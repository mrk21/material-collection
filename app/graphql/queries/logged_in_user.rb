# frozen_string_literal: true

class Queries::LoggedInUser < Queries::Base
  description 'A logged in user'
  type Types::UserType, null: false

  def resolve
    authenticate!
    current_user
  end
end

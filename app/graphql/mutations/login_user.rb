# frozen_string_literal: true

class Mutations::LoginUser < Mutations::Base
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true

  def resolve(email:, password:)
    user = User.find_by(email: email)
    raise Errors::NotAuthenticated unless user.present? && user.authenticate(password)
    session[:user_id] = user.id
    { user: user }
  end
end

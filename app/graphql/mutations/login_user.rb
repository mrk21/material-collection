# frozen_string_literal: true

class Mutations::LoginUser < GraphQL::Schema::Mutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true

  def resolve(email:, password:)
    user = User.find_by(email: email)
    return UnauthenticatedError.new unless user.present? && user.authenticate(password)
    context[:session][][:user_id] = user.id
    { user: user }
  end
end

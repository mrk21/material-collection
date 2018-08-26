# frozen_string_literal: true

class Mutations::LogoutUser < GraphQL::Schema::Mutation
  field :ok, Boolean, null: true

  def resolve
    context[:session][].delete(:user_id)
    { ok: true }
  end
end

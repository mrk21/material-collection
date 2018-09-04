# frozen_string_literal: true

class Mutations::LogoutUserMutation < Mutations::BaseMutation
  field :ok, Boolean, null: true

  def resolve
    session.delete(:user_id)
    { ok: true }
  end
end

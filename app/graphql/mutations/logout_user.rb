# frozen_string_literal: true

class Mutations::LogoutUser < Mutations::Base
  field :ok, Boolean, null: true

  def resolve
    session.delete(:user_id)
    { ok: true }
  end
end

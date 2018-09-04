# frozen_string_literal: true

class Types::MutationType < Types::BaseObject
  field :update_project, mutation: Mutations::UpdateProjectMutation
  field :login_user, mutation: Mutations::LoginUserMutation
  field :logout_user, mutation: Mutations::LogoutUserMutation
end

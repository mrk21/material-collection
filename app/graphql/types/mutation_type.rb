class Types::MutationType < Types::BaseObject
  field :update_project, mutation: Mutations::UpdateProject
  field :login_user, mutation: Mutations::LoginUser
  field :logout_user, mutation: Mutations::LogoutUser
end

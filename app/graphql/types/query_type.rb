# frozen_string_literal: true

class Types::QueryType < Types::BaseObject
  field :logged_in_user, resolver: Queries::LoggedInUser
  field :user, resolver: Queries::User
  field :userProjects, resolver: Queries::UserProjects
  field :projectAssets, resolver: Queries::ProjectAssets
  field :project, resolver: Queries::Project
end

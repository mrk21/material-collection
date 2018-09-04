# frozen_string_literal: true

class Types::QueryType < Types::BaseObject
  field :logged_in_user, resolver: Queries::LoggedInUserQuery
  field :user, resolver: Queries::UserQuery
  field :userProjects, resolver: Queries::UserProjectsQuery
  field :projectAssets, resolver: Queries::ProjectAssetsQuery
  field :project, resolver: Queries::ProjectQuery
end

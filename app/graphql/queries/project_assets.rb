# frozen_string_literal: true

class Queries::ProjectAssets < GraphQL::Schema::Resolver
  description 'Assets posted to the project'
  argument :projectId, String, required: true
  type [Types::AssetType], null: false

  def resolve(project_id:)
    Loaders::RecordAssociationLoader.for(Project, :assets).load(project_id)
  end
end

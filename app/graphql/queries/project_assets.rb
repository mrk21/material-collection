# frozen_string_literal: true

class Queries::ProjectAssets < GraphQL::Schema::Resolver
  description 'Assets posted to the project'
  argument :projectId, String, required: true
  type Types::OffsetBasedPaginationType[Types::AssetType], null: false

  def resolve(project_id:)
    Project.find(project_id).assets.page(1).per(20)
  end
end

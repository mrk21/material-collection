# frozen_string_literal: true

class Queries::ProjectAssets < Queries::Base
  description 'Assets posted to the project'

  argument :projectId, String, required: true
  argument :pagination, Types::OffsetBasedPaginationType::PageArgumentType, required: false,
                                                                            default_value: { page: 1, per: 20 }

  type Types::OffsetBasedPaginationType[Types::AssetType], null: false

  def resolve(project_id:, pagination:)
    authenticate!
    Loaders::RecordLoader.for(Project).load(project_id).then do |project|
      policy_scope(project.assets).page(pagination[:page]).per(pagination[:per])
    end
  end
end

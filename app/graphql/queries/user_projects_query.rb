# frozen_string_literal: true

class Queries::UserProjectsQuery < Queries::BaseQuery
  description 'Projects created by the user'

  argument :userId, String, required: true
  argument :pagination, Types::OffsetBasedPaginationType::PageArgumentType, required: false,
                                                                            default_value: { page: 1, per: 20 }

  type Types::OffsetBasedPaginationType[Types::ProjectType], null: false

  def resolve(user_id:, pagination:)
    authenticate!
    Loaders::RecordLoader.for(User).load(user_id.to_i).then do |user|
      authorize user, :show?
      policy_scope(user.projects).page(pagination[:page]).per(pagination[:per])
    end
  end
end

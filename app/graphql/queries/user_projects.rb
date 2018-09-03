# frozen_string_literal: true

class Queries::UserProjects < GraphQL::Schema::Resolver
  description 'Projects created by the user'
  argument :pagination, Types::OffsetBasedPaginationType::PageArgumentType, required: false, default_value: { page: 1, per: 20 }
  argument :userId, String, required: true
  type Types::OffsetBasedPaginationType[Types::ProjectType], null: false

  def resolve(pagination:, user_id:)
    User.find(user_id).projects.page(pagination[:page]).per(pagination[:per])
  end
end

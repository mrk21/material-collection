# frozen_string_literal: true

class Queries::Project < GraphQL::Schema::Resolver
  description 'A project'
  argument :id, String, required: true
  type Types::ProjectType, null: false

  def resolve(id:)
    Loaders::RecordLoader.for(Project).load(id)
  end
end

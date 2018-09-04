# frozen_string_literal: true

class Queries::ProjectQuery < Queries::BaseQuery
  description 'A project'
  argument :id, String, required: true
  type Types::ProjectType, null: false

  def resolve(id:)
    authenticate!
    Loaders::RecordLoader.for(Project).load(id).then do |project|
      authorize project, :show?
      project
    end
  end
end

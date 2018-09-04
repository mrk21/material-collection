# frozen_string_literal: true

class Mutations::UpdateProjectMutation < Mutations::BaseMutation
  argument :id, Types::IDStringType, required: true
  argument :title, String, required: true
  argument :description, String, required: false

  field :project, Types::ProjectType, null: true

  def resolve(id:, title:, description:)
    authenticate!
    project = Project.find(id)
    authorize project, :update?
    project.assign_attributes(title: title, description: description)

    if project.save
      { project: project }
    else
      GraphQL::ExecutionError.new(project.errors.full_messages.join("\n"))
    end
  end
end

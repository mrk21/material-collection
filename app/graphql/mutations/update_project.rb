class Mutations::UpdateProject < GraphQL::Schema::Mutation
  argument :id, String, required: true
  argument :title, String, required: true
  argument :description, String, required: false

  field :project, Types::ProjectType, null: true

  def resolve(id:, title:, description:)
    project = Project.find(id)
    project.assign_attributes(title: title, description: description)

    if project.save
      { project: project }
    else
      GraphQL::ExecutionError.new(project.errors.full_messages.join("\n"))
    end
  end
end

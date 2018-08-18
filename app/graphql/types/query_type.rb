class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :hoges, [Types::HogeType], null: false do
     description 'All hoges'
  end

  field :user, Types::UserType, null: false do
    description 'A user'
    argument :id, String, required: true
  end

  field :userProjects, [Types::ProjectType], null: false do
     description 'Projects created by the user'
     argument :userId, String, required: true
  end

  field :projectAssets, [Types::AssetType], null: false do
    description 'Assets posted to the project'
    argument :projectId, String, required: true
  end

  def hoges
    Hoge.all
  end

  def user(id:)
    User.find(id)
  end

  def user_projects(user_id:)
    user = User.find(user_id)
    user.projects
  end

  def project_assets(project_id:)
    project = Project.find(project_id)
    project.assets
  end
end

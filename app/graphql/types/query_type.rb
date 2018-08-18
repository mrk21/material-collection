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
    Loaders::RecordLoader.for(User).load(id).then do |user|
      user
    end
  end

  def user_projects(user_id:)
    Loaders::RecordAssociationLoader.for(User, :projects).load(user_id).then do |projects|
      projects
    end
  end

  def project_assets(project_id:)
    Loaders::RecordAssociationLoader.for(Project, :assets).load(project_id).then do |assets|
      assets
    end
  end
end

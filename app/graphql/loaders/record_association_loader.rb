class Loaders::RecordAssociationLoader < GraphQL::Batch::Loader
  def initialize(model, association)
    @model = model
    @association = association
  end

  def load(id)
    id = id.to_i
    super
  end

  def perform(ids)
    @model.includes(@association).where(id: ids).each do |record|
      fulfill record.id, record.send(@association)
    end

    ids.each do |id|
      fulfill id, Errors::NotFoundError.new("id = #{id}") unless fulfilled?(id)
    end
  end
end
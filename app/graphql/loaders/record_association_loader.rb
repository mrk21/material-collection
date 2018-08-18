class Loaders::RecordAssociationLoader < GraphQL::Batch::Loader
  def initialize(model, association)
    @model = model
    @association = association
  end

  def perform(ids)
    @model.includes(@association).where(id: ids).each do |record|
      fulfill record.id.to_s, record.send(@association)
    end

    ids.each do |id|
      fulfill id, nil unless fulfilled?(id)
    end
  end
end
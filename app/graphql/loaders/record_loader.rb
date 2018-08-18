class Loaders::RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def perform(ids)
    @model.where(id: ids).each do |record|
      fulfill record.id.to_s, record
    end

    ids.each do |id|
      fulfill id, nil unless fulfilled?(id)
    end
  end
end
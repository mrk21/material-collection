class Loaders::RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def load(id)
    id = id.to_i
    super
  end

  def perform(ids)
    @model.where(id: ids).each do |record|
      fulfill record.id, record
    end

    ids.each do |id|
      fulfill id, Errors::NotFoundError.new("id = #{id}") unless fulfilled?(id)
    end
  end
end
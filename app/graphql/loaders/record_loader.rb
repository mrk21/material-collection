# frozen_string_literal: true

class Loaders::RecordLoader < GraphQL::Batch::Loader
  def initialize(model)
    @model = model
  end

  def load(id)
    super.then do |fetched|
      raise Errors::NotFoundError, "id = #{id}" if fetched.nil?
      fetched
    end
  end

  def perform(ids)
    @model.where(id: ids).each do |record|
      fulfill record.id, record
    end

    ids.each do |id|
      fulfill id, nil unless fulfilled?(id)
    end
  end
end

class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :hoges, [Types::HogeType], null: false, description: 'All hoges'

  def hoges
    Hoge.all
  end
end

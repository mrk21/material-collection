# frozen_string_literal: true

class MaterialCollectionSchema < GraphQL::Schema
  mutation Types::MutationType
  query Types::QueryType
  use GraphQL::Batch
end

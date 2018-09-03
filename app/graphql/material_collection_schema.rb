# frozen_string_literal: true

class MaterialCollectionSchema < GraphQL::Schema
  mutation Types::MutationType
  query Types::QueryType
  use GraphQL::Batch

  rescue_from ActiveRecord::RecordNotFound do |e|
    Errors::RecordNotFound.new(e.message)
  end
end

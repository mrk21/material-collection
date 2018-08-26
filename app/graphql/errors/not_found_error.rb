# frozen_string_literal: true

class Errors::NotFoundError < GraphQL::ExecutionError
  def initialize(where)
    super "Not found(#{where})"
  end
end

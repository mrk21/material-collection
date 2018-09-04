# frozen_string_literal: true

class Errors::NotFoundError < Errors::BaseError
  def initialize(where)
    super "Not found(#{where})"
  end
end

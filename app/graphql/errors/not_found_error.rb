# frozen_string_literal: true

class Errors::NotFoundError < Errors::BaseError
  def initialize
    super "Not found"
  end
end

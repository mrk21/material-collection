# frozen_string_literal: true

class Errors::NotAuthenticatedError < Errors::BaseError
  def initialize
    super 'Not authenticated!'
  end
end

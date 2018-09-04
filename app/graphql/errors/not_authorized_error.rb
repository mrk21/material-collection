# frozen_string_literal: true

class Errors::NotAuthorizedError < Errors::BaseError
  def initialize
    super 'Not authorized!'
  end
end

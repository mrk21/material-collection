# frozen_string_literal: true

class Errors::NotAuthorized < Errors::Base
  def initialize
    super 'Not authorized!'
  end
end

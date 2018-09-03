# frozen_string_literal: true

class Errors::NotAuthenticated < Errors::Base
  def initialize
    super 'Not authenticated!'
  end
end

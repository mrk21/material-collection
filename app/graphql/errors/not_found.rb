# frozen_string_literal: true

class Errors::NotFound < Errors::Base
  def initialize(where)
    super "Not found(#{where})"
  end
end

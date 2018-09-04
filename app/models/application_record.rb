# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_param
    Types::IDStringType.coerce_result(id)
  end

  def to_key
    [Types::IDStringType.coerce_result(id)]
  end
end

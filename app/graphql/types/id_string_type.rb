# frozen_string_literal: true

class Types::IDStringType < GraphQL::Schema::Scalar
  description 'ID type'

  def self.coerce_input(input_value, _context)
    Hashids.new.decode(input_value).first
  end

  def self.coerce_result(ruby_value, _context)
    Hashids.new.encode(ruby_value)
  end
end

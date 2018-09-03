# frozen_string_literal: true

class AssetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end

# frozen_string_literal: true

class Asset < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :project
end

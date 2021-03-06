# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :assets

  validates :title, presence: true
end

class User < ApplicationRecord
  has_secure_password

  has_many :projects, foreign_key: :owner_id
  has_many :assets, foreign_key: :author_id

  validates :password, presence: true, length: { minimum: 6 }
end

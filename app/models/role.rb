class Role < ApplicationRecord
  validates :role, presence: true
  validates :role, acceptance: { accept: %w[ADMIN USER] }

  has_many :users
end

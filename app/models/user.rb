class User < ApplicationRecord
  # Include default devise modules. Others available are:
  validates :full_name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :role, presence: true
  validates :email, presence: true

  validates :username, :email, uniqueness: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :authentication_keys=>[:username]

  belongs_to :role
end

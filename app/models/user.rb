class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :messages,dependent: :destroy

  # Validations
  validates :email, presence: true
  validates :username, presence: true
  validates :encrypted_password, presence: true
end

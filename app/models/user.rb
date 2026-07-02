class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable

  has_many :consultations

  validates :employee_number, presence: true, uniqueness: true
  validates :name, presence: true
end

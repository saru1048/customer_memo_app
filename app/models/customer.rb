class Customer < ApplicationRecord
  has_many :consultations, dependent: :destroy

  validates :name, presence: { message: "は必須です" }
end

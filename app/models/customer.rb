class Customer < ApplicationRecord
  has_many :consultations, dependent: :destroy
end

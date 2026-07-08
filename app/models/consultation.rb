class Consultation < ApplicationRecord
  belongs_to :customer
  belongs_to :user

  validates :consultation_type, presence: true
  validates :status, presence: true
  validates :summary, presence: true
  validates :consulted_at, presence: true

  enum :consultation_type, {
    mnp: 0,
    new_contract: 1,
    device_change: 2,
    contract_info_change: 3,
    other: 4
  }, validate: true

  enum :status, {
    pending: 0,        # 未対応
    in_progress: 1,    # 対応中
    completed: 2,      # 完了
    not_required: 3    # 対応不要
  }, validate: true
end

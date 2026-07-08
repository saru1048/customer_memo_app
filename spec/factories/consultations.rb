FactoryBot.define do
  factory :consultation do
    association :customer
    association :user
    consultation_type { :mnp }
    status { :pending }
    summary { "MNPについて相談" }
    consulted_at { Time.current }
  end
end

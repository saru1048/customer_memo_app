FactoryBot.define do
  factory :user do
    employee_number { "1001" }
    name { "テストスタッフ" }
    password { "password" }
  end
end

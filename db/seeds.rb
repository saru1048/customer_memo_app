User.find_or_create_by!(employee_number: "1001") do |user|
  user.name = "初期スタッフ"
  user.password = "password"
  user.password_confirmation = "password"
end

User.find_or_create_by!(employee_number: "1002") do |user|
  user.name = "山田 太郎"
  user.password = "password"
  user.password_confirmation = "password"
end

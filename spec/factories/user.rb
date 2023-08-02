FactoryBot.define do
  factory :user do
    username { 'username' }
    email { 'test@example.com' }
    password { 'password' }
  end
end

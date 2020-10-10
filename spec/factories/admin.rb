FactoryBot.define do
  factory :admin do
    email { 'admin@mail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    type { 'Admin' }
  end
end

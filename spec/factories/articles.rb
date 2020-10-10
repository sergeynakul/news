FactoryBot.define do
  factory :article do
    title { 'Article title' }
    content { 'Article content' }
    visibility { 'public' }
    published { true }
    admin

    trait :invalid do
      title { nil }
    end
  end
end

FactoryBot.define do
  sequence :title do |n|
    "Article title #{n}"
  end

  factory :article do
    title
    content { 'Article content' }
    visibility { 'public' }
    published { true }

    trait :invalid do
      title { nil }
    end
  end
end

FactoryGirl.define do
  factory :user_api_key, class: 'ApiKey' do
    association :owner, factory: :user
  end
end

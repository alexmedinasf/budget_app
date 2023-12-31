FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { Faker::Internet.unique.email }
    password { 'securepassword' }
    password_confirmation { 'securepassword' }

    # If you have additional attributes, add them here.
    # For instance:
    # confirmed_at { Time.now }

    # If using Devise's confirmable module:
    # after(:create) do |user|
    #   user.confirm
    # end
  end
end

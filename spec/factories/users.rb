# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "twitter"
    uid "12345"
    name "Bob"
  end
  factory :admin, :class => :user do
    provider "github"
    uid '11111'
    name 'Arnold'
    admin true
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    date "2013-03-19 18:01:14"
    location "MyString"
    description "MyText"
  end
end

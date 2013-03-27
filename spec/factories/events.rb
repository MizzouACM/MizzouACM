# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    date DateTime.tomorrow
    location "MyString"
    description "MyText"

    factory :past_event do
      date DateTime.yesterday
    end
  end
end

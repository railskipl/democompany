# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_u, :class => 'ContactUs' do
    name "MyString"
    email "MyString"
    subject "MyString"
    message "MyText"
  end
end

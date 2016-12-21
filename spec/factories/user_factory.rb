FactoryGirl.define do
	sequence(:email) { |n| 'user#{{n}@bikes2go.com' }

  factory :user do
    email 
    password "123456"
    first_name "John"
    last_name "Smith"
    admin false
  end

  factory :admin, class: User do
    email 
    password "789012"
    first_name "Jane"
    last_name "Smith"
    admin true
  end
end
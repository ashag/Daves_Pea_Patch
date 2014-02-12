FactoryGirl.define do 

  factory :user, class: User do 
    id 1
    username 'Asha'
    email 'abd@gmail.com'
    uid '123456'
    provider 'twitter'
    admin false
  end

  factory :user_admin, class: User do
    id 2
    username 'Dave'
    uid '456789'
    provider 'twitter'
    admin true
  end

  factory :tool, class: Tool do
    id 1
    name 'plow'
    qty 1
  end

  factory :comment do
    user_id 1
    body "MyText"
  end

  factory :post do
    title "MyString"
    body "MyText"
  end

  factory :tool2 do
    name "MyString"
    qty "MyString"
    integer "MyString"
  end
end
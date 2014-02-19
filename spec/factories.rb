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

  factory :user_no_email, class: User do
    id 3
    username 'Asha'
    email nil
    uid '123456'
    provider 'twitter'
    admin false
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
    qty 2
  end

  factory :event do 
    title "Gardening"
    date "04-05-14"
    time "04:00PM"
    location "somewhere"
    description "garden garden garden"
  end

  factory :event_date do 
    title "Gardening"
    date "2014-05-04 00:00:00"
    time "04:00PM"
    location "somewhere"
    description "garden garden garden"
  end
end
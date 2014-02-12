# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_post, :class => 'UserPosts' do
    user_id 1
    post_id 1
  end
end

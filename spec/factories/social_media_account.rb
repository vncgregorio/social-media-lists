FactoryBot.define do
  factory :social_media_account do
    association :person, factory: :person
    association :network, factory: :network
    username {'vncgregorio'}
    profile_link {'https://www.twitter.com/vncgregorio'}
  end
end

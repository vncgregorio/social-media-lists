FactoryBot.define do
  factory :post do
    association :social_media_account, factory: :social_media_account
    post_date {Date.parse('31-12-2019')}
    link { 'https://twitter.com/AkitaOnRails/status/1246448526411943936?s=20' }
    content { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ultrices tincidunt arcu non.' }
  end
end

FactoryBot.define do
  factory :list_member do
    association :person, factory: :person
    association :list, factory: list
  end
end

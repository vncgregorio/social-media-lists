# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { build(:person) }

  it 'is valid with valid attributes' do
    expect(person).to be_valid
  end

  it 'is not valid without a name' do
    person.name = nil
    expect(person).not_to be_valid
  end

  describe "associations" do
    it { should have_many(:social_media_accounts) }
    it { should have_many(:list_members) }
  end

end

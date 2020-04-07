# == Schema Information
#
# Table name: list_members
#
#  id         :bigint           not null, primary key
#  person_id  :integer
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ListMember, type: :model do
  let(:list_member) { build(:list_member) }

  it 'is valid with valid attributes' do
    expect(list_member).to be_valid
  end

  it 'is not valid without a person' do
    list_member.person = nil
    expect(list_member).not_to be_valid
  end

  it 'is not valid without a list' do
    list_member.list = nil
    expect(list_member).not_to be_valid
  end

  describe "associations" do
    it { should belong_to(:person) }
    it { should belong_to(:list) }
  end
end

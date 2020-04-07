# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build(:list) }

  it 'is valid with valid attributes' do
    expect(list).to be_valid
  end

  it 'is not valid without a name' do
    list.name = nil
    expect(list).not_to be_valid
  end

  it 'is not valid with a non unique name' do
    saved_list = create(:list)    
    list.name = nil
    expect(list).not_to be_valid
  end

  describe "associations" do
    it { should have_many(:list_members) }
  end
end

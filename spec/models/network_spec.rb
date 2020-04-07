# == Schema Information
#
# Table name: networks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  icon       :string(255)
#  connector  :string(255)      default("db/seed")
#  api_url    :string(255)      default("database")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Network, type: :model do
  let(:network) { build(:network) }

  it 'is valid with valid attributes' do
    expect(network).to be_valid
  end

  it 'is not valid without a name' do
    network.name = nil
    expect(network).not_to be_valid
  end

  it 'is not valid without an icon' do
    network.icon = nil
    expect(network).not_to be_valid
  end

  it 'is not valid without a connector' do
    network.connector = nil
    expect(network).not_to be_valid
  end

  it 'is not valid without an api_url' do
    network.api_url = nil
    expect(network).not_to be_valid
  end

  describe "associations" do
    it { should have_many(:social_media_accounts) }
  end

end

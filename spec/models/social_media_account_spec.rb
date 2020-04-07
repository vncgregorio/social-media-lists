# == Schema Information
#
# Table name: social_media_accounts
#
#  id           :bigint           not null, primary key
#  person_id    :integer
#  network_id   :integer
#  username     :string(255)
#  profile_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe SocialMediaAccount, type: :model do
  let(:social_media_account) { build(:social_media_account) }

  it 'is valid with valid attributes' do
    expect(social_media_account).to be_valid
  end

  it 'is not valid without a profile_link' do
    social_media_account.profile_link = nil
    expect(social_media_account).not_to be_valid
  end

  it 'is not valid without a person' do
    social_media_account.person = nil
    expect(social_media_account).not_to be_valid
  end

  it 'is not valid without a network' do
    social_media_account.network = nil
    expect(social_media_account).not_to be_valid
  end

  describe "associations" do
    it { should have_many(:posts) }

    it 'when destroyed will leave post records' do
      social_media_account.save!
      post = create(:post, :social_media_account => social_media_account)
      expect { social_media_account.destroy }.not_to change { Post.count }
    end
  end

end

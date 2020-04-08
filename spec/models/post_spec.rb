# == Schema Information
#
# Table name: posts
#
#  id                      :bigint           not null, primary key
#  social_media_account_id :integer
#  post_date               :datetime
#  link                    :string(255)
#  content                 :text(65535)
#  image_link              :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a link' do
    post.link = nil
    expect(post).not_to be_valid
  end

  it 'is not valid without a post_date' do
    post.post_date = nil
    expect(post).not_to be_valid
  end

  it 'is not valid without a content' do
    post.content = nil
    expect(post).not_to be_valid
  end

  describe "associations" do
    it 'is valid without social_media_account' do
      post.social_media_account = nil
      expect(post).to be_valid
    end
  end

  it 'knows the social_media_lists it is included' do
    list = create(:list)
    person = create(:person)
    list_member = create(:list_member,
                    :list => list,
                    :person => person
                  )
    social_media_account = create(:social_media_account,
                    :person => person
                  )
    new_post = create(:post,
                    :social_media_account => social_media_account
                  )
    expect(new_post.lists).to include(list.name)
  end
end

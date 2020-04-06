# == Schema Information
#
# Table name: social_media_accounts
#
#  id           :bigint           not null, primary key
#  person_id    :integer
#  network      :string(255)
#  profile_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class SocialMediaAccount < ApplicationRecord

  belongs_to :person, :optional => false
  has_many :posts

  validates_presence_of :network
  validates_presence_of :profile_link

  validates_uniqueness_of :profile_link  

end

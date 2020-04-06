class SocialMediaAccount < ApplicationRecord

  belongs_to :person, :optional => false
  has_many :posts

  validates_presence_of :network
  validates_presence_of :profile_link

  validates_uniqueness_of :profile_link  

end

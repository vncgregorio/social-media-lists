# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord

  has_many :social_media_accounts
  has_many :list_members

  validates_presence_of :name

  scope :filter_by_lists, -> (lists) { joins(:list_members).where('`list_members`.list_id IN (?)', lists)}

end

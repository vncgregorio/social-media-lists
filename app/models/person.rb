class Person < ApplicationRecord

  has_many :social_media_accounts
  has_many :list_members

  validates_presence_of :name

  scope :filter_by_lists, -> (lists) { joins(:list_members).where('`list_members`.list_id IN (?)', lists)}

end

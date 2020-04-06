class List < ApplicationRecord

  has_many :list_members

  validates_presence_of :name
  validates_uniqueness_of :name

end

# == Schema Information
#
# Table name: lists
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class List < ApplicationRecord

  has_many :list_members

  validates_presence_of :name
  validates_uniqueness_of :name

end

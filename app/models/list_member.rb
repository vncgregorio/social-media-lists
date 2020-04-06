# == Schema Information
#
# Table name: list_members
#
#  id         :bigint           not null, primary key
#  person_id  :integer
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ListMember < ApplicationRecord

  belongs_to :person, :optional => false
  belongs_to :list, :optional => false

end

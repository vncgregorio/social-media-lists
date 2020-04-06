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
require 'rails_helper'

RSpec.describe ListMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

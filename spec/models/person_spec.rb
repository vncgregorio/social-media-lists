# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Person, type: :model do

  it 'is valid with valid attributes'
  it 'is not valid without a name'
  it 'is has_many valid without a name'

end

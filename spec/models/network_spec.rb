# == Schema Information
#
# Table name: networks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  icon       :string(255)
#  connector  :string(255)      default("db/seed")
#  api_url    :string(255)      default("database")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Network, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

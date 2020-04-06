# == Schema Information
#
# Table name: posts
#
#  id                      :bigint           not null, primary key
#  social_media_account_id :integer
#  post_date               :datetime
#  link                    :string(255)
#  content                 :text(65535)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

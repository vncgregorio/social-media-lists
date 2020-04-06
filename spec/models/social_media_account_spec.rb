# == Schema Information
#
# Table name: social_media_accounts
#
#  id           :bigint           not null, primary key
#  person_id    :integer
#  network      :string(255)
#  profile_link :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe SocialMediaAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

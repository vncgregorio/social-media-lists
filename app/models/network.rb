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
class Network < ApplicationRecord

  has_many :social_media_accounts

  validates_presence_of :name
  validates_presence_of :icon
  validates_presence_of :connector
  validates_presence_of :api_url

end

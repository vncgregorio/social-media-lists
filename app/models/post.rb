# == Schema Information
#
# Table name: posts
#
#  id                      :bigint           not null, primary key
#  social_media_account_id :integer
#  post_date               :datetime
#  link                    :string(255)
#  content                 :text(65535)
#  image_link              :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Post < ApplicationRecord
  include Filterable

  belongs_to :social_media_account

  validates_presence_of :link
  validates_presence_of :post_date
  validates_presence_of :content

  scope :filter_by_content, -> (content) { where('content LIKE ?', "%#{content}%") }
  scope :filter_by_networks, -> (networks) { joins(:social_media_account).where('`social_media_accounts`.network_id IN (?)', networks) }
  scope :filter_by_authors, -> (authors) { joins(:social_media_account => :person).where('`people`.id IN (?)', authors)}
  scope :filter_by_initial_date, -> (initial_date) { where('post_date >= ?', initial_date)}
  scope :filter_by_final_date, -> (final_date) { where('post_date <= ?', final_date)}
end

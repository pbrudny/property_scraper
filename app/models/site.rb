class Site < ApplicationRecord
  has_many :search_links

  validates :title, presence: true
  validates :url, presence: true
end

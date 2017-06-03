class District < ApplicationRecord
  has_many :search_links
  has_many :ads

  validates :name, presence: true
end

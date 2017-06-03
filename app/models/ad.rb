class Ad < ApplicationRecord
  belongs_to :district
  belongs_to :search_link

  has_many :statuses

  validates :offer_id, uniqueness: true
end

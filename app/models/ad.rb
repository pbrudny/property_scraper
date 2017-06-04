class Ad < ApplicationRecord
  belongs_to :district
  belongs_to :search_link
  belongs_to :status

  validates :offer_id, uniqueness: true
  validates :search_link, presence: true
  validates :district, presence: true
  validates :status, presence: true
end

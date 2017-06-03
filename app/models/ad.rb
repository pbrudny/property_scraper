class Ad < ApplicationRecord
  belongs_to :district
  belongs_to :search_link

  validates :offer_id, uniqueness: true
end

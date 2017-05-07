class Ad < ApplicationRecord
  belongs_to :district

  validates :offer_id, uniqueness: true
end

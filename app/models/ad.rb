class Ad < ApplicationRecord
  belongs_to :load
  belongs_to :district
  belongs_to :search_link
  belongs_to :status

  has_many :images
  has_many :appointments

  validates :offer_id, uniqueness: true
  validates :search_link, presence: true
  validates :district, presence: true
  validates :status, presence: true
  validates :load, presence: true
end

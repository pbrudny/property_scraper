class Ad < ApplicationRecord
  belongs_to :load
  belongs_to :district
  belongs_to :search_link
  belongs_to :status

  has_many :images
  has_many :appointments
  has_many :notes

  validates :offer_id, uniqueness: true
  validates :search_link, presence: true
  validates :district, presence: true
  validates :status, presence: true
  validates :load, presence: true

  def mark_interesting!
    update(status_id: Status.find_by(name: 'interesting'))
  end

  def mark_not_interesting!
    update(status_id: Status.find_by(name: 'not_interesting'))
  end
end
